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
    
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int)
    {
        /*
        //sima stringé konvertálás
        let message = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        self.msg = message! as String
        print(self.msg!)
        */
        //mavlink konvertálás
        message.delegate = self
        message.parseData(data)
        
        socket?.readData(withTimeout: 30, tag: 1)
    }
    
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
        case 42:
            let mission = (message as? MVMessageMissionCurrent)!
            logMessageArray.append(String(describing: mission))
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
    
    func sendMessage(msg: String)
    {
        let data = msg.data(using: String.Encoding.utf8)
        socket?.write(data!, withTimeout: 30, tag: 1)
    }
    
    func sendm()
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
    }
    
    func flightMode () -> String
    {
        switch self.heartBeat!.customMode()
        {
        case 0:
            return "MANUAL"
        case 1:
            return "CIRCLE"
        case 2:
            return "STABILIZE"
        case 3:
            return "TRAINING"
        case 4:
            return "ACRO"
        case 5:
            return "FLY_BY_WIRE_A"
        case 6:
            return "FLY_BY_WIRE_B"
        case 7:
            return "CRUISE"
        case 8:
            return "AUTOTUNE"
        case 10:
            return "AUTO"
        case 11:
            return "RTL"
        case 12:
            return "LOITER"
        case 14:
            return "AVOID_ADSB"
        case 15:
            return "GUIDED"
        case 16:
            return "INITIALISING"
        case 17:
            return "QSTABILIZE"
        case 18:
            return "QHOVER"
        case 19:
            return "QLOITER"
        case 20:
            return "QLAND"
        case 21:
            return "QRTL"
        default:
            return "OTHER"
        }
    }
    
    func armDisarm()
    {
        var msg : MVMessageCommandLong?
        
        if  ((self.heartBeat!.baseMode() & 128) == 0)
        {
            msg = MVMessageCommandLong(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, command: MAV_CMD_COMPONENT_ARM_DISARM, confirmation: 0, param1: 1, param2: 0, param3: 0, param4: 0, param5: 0, param6: 0, param7: 0)
        }else
        {
            msg = MVMessageCommandLong(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, command: MAV_CMD_COMPONENT_ARM_DISARM, confirmation: 0, param1: 0, param2: 0, param3: 0, param4: 0, param5: 0, param6: 0, param7: 0)
        }
        message.send(msg)
    }
    
    func missionStart()
    {
        let currentMission = MVMessageMissionSetCurrent(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, seq: 1)
        message.send(currentMission)
        
        let startMission = MVMessageCommandLong(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, command: MAV_CMD_MISSION_START, confirmation: 0, param1: 1, param2: 6, param3: 0, param4: 0, param5: 0, param6: 0, param7: 0)
        message.send(startMission)
    }
}
