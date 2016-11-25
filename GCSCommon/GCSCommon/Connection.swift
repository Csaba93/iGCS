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
    var socket: GCDAsyncSocket?
    var globalPosition: MVMessageGlobalPositionInt?
    var statusTextarray = [String]()
    
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
        //socket?.readData(toLength: 20, withTimeout: 30, tag: 1)
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
        //print(message)
        switch message.message.msgid
        {
        case 0:
            print("Heartbeat")
        case 1:
            print("sys_status")
        case 30:
            print("Attitude")
        case 33:
            print("Global position")
            globalPosition = (message as? MVMessageGlobalPositionInt)!
        case 42:
            print("mission_current")
        case 74:
            print("vfr hud")
        case 253:
            print("statustext")
            let statusText: MVMessageStatustext = (message as? MVMessageStatustext)!
            statusTextarray.append((statusText.text())!) //TODO üríteni a tárat
            print(statusText.text())
        default:
            print("other")
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
        let msg = MVMessageRequestDataStream(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, reqStreamId: 6, reqMessageRate: 2, startStop: 1)
        message.send(msg)
    }
}
