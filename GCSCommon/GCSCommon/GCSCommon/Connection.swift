//
//  Connection.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2016. 11. 23..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//
import Foundation
import UIKit
import CocoaAsyncSocket

class Connection: NSObject, GCDAsyncSocketDelegate, MVMavlinkDelegate
{
    var message = MVMavlink()
    var sendmessage = MVMessage()
    var socket : GCDAsyncSocket?
    var globalPosition : MVMessageGlobalPositionInt?
    var vfrHud : MVMessageVfrHud?
    var sysStatus : MVMessageSysStatus?
    var heartBeat : MVMessageHeartbeat?
    var statusTextArray = [String]()
    var logMessageArray = [String]()
    var missionItems = [MVMessageMissionItem]()
    var numberOfItem : MVMessageMissionCount?
    
    // MARK: - Connection maker
    
    func connection(server: String, port: Int)
    {
        socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        var err: NSError?
        do
        {
            try socket!.connect(toHost: server, onPort: UInt16(port))
        }
        catch
        {
            print("ERRR:\(err)")
        }
        socket?.readData(withTimeout: 30, tag: 1)
    }
    
    // MARK: - Socket reader
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int)
    {
        message.delegate = self
        message.parseData(data)
        socket?.readData(withTimeout: 30, tag: 1)
    }
    
    // MARK: - Delegate functions

    func mavlink(_ mavlink: MVMavlink!, didGet message: MVMessageProtocol!)
    {
        switch message.message.msgid
        {
        case 0:
            heartBeat = (message as? MVMessageHeartbeat)!
            logMessageArray.append(String(describing: heartBeat))
        case 1:
            sysStatus = (message as? MVMessageSysStatus)!
            logMessageArray.append(String(describing: sysStatus))
        case 30:
            let attitude = (message as? MVMessageAttitude)!
            logMessageArray.append(String(describing: attitude))
        case 33:
            globalPosition = (message as? MVMessageGlobalPositionInt)!
            logMessageArray.append(String(describing: globalPosition))
        case 39:
            let missionItem = (message as? MVMessageMissionItem)!
            missionItems.append(missionItem)
            print(missionItem)
        case 42:
            let mission = (message as? MVMessageMissionCurrent)!
            logMessageArray.append(String(describing: mission))
        case 44:
            numberOfItem = (message as? MVMessageMissionCount)!
            logMessageArray.append(String(describing: numberOfItem))
            print(numberOfItem!.count())
        case 74:
            vfrHud = (message as? MVMessageVfrHud)!
            logMessageArray.append(String(describing: vfrHud))
        case 253:
            if (statusTextArray.count >= 40)
            {
                statusTextArray.removeAll()
            }
            let statusText: MVMessageStatustext = (message as? MVMessageStatustext)!
            statusTextArray.append((statusText.text())!)
            logMessageArray.append((statusText.text())!)
        default:
            break
        }
    }
    
    func mavlink(_ mavlink: MVMavlink!, shouldWrite data: Data!) -> Bool
    {
        socket?.write(data!, withTimeout: 30, tag: 1)
        return true
    }
    
    // MARK: - Stream getter
    
    func getDataStream()
    {
        var msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 1, reqMessageRate: 2, startStop: 1)
        message.send(msg)
        
        msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 2, reqMessageRate: 2, startStop: 1)
        message.send(msg)
        
        msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 3, reqMessageRate: 2, startStop: 1)
        message.send(msg)
        
        msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 6, reqMessageRate: 2, startStop: 1)
        message.send(msg)
        
        msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 10, reqMessageRate: 4, startStop: 1)
        message.send(msg)
        
        msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 11, reqMessageRate: 4, startStop: 1)
        message.send(msg)
        
        msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 12, reqMessageRate: 2, startStop: 1)
        message.send(msg)
        
        missionCommands.getTheNumberOfItems()
    }
}
