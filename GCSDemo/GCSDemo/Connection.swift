//
//  Connection.swift
//  GCSDemo
//
//  Created by Csaba Nádasi on 2016. 10. 27..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
import Mavlink

extension mavlink_message_t: CustomStringConvertible {
    public var description: String {
        var message = self
        switch msgid {
        case 0:
            var heartbeat = mavlink_heartbeat_t()
            mavlink_msg_heartbeat_decode(&message, &heartbeat);
            return "HEARTBEAT mavlink_version: \(heartbeat.mavlink_version)\n"
        case 1:
            var sys_status = mavlink_sys_status_t()
            mavlink_msg_sys_status_decode(&message, &sys_status)
            return "SYS_STATUS comms drop rate: \(sys_status.drop_rate_comm)%\n"
        case 30:
            var attitude = mavlink_attitude_t()
            mavlink_msg_attitude_decode(&message, &attitude)
            return "ATTITUDE roll: \(attitude.roll) pitch: \(attitude.pitch) yaw: \(attitude.yaw)\n"
        case 32:
            return "LOCAL_POSITION_NED\n"
        case 33:
            return "GLOBAL_POSITION_INT\n"
        case 253:
            var status = mavlink_statustext_t()
            mavlink_msg_statustext_decode(&message, &status)
            return "Statustext: severity: \(status.severity), status: \(status.text)"
        default:
            return "OTHER Message id \(message.msgid) received\n"
        }
    }
}

class Connection: NSObject, GCDAsyncSocketDelegate {

    var socket: GCDAsyncSocket?
    var msg: String?
    
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
    
    func socket(_ sock: GCDAsyncSocket!, didRead data: Data!, withTag tag: Int)
    {
        //sima stringé konvertálás
        //let message = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
       // self.msg = message! as String
        
      /*
        //hexává konvertálás
        var hexString = NSMutableString()
        for byte in data
        {
             hexString.appendFormat("%02x ", UInt(byte))
        }
        print(hexString)
        let strData = data
        print(strData!)

        */
        
        
        //mavlink konvertálás
        for byte in data
        {
            var msg = mavlink_message_t()
            var status = mavlink_status_t()
            let chanel = UInt8(MAVLINK_COMM_1.rawValue)
            
            if mavlink_parse_char(chanel, byte, &msg, &status) != 0
            {
                print(msg.description)
            }
        }
       socket?.readData(withTimeout: 30, tag: 1)
    }
    
    
    func sendMessage(msg: String)
    {
        let data = msg.data(using: String.Encoding.utf8)
        socket?.write(data, withTimeout: 30, tag: 1)
    }
    
}
