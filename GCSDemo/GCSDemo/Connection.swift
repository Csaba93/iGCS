//
//  Connection.swift
//  GCSDemo
//
//  Created by Csaba Nádasi on 2016. 10. 27..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//

import UIKit
import CocoaAsyncSocket

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
    }
    
    func socket(_ sock: GCDAsyncSocket!, didRead data: Data!, withTag tag: Int)
    {
        var message = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        self.msg = message! as String
        //üzenetből hexadump
        print(message!)
        socket?.readData(withTimeout: 30, tag: 1)
    }
    
    func sendMessage(msg: String)
    {
        let data = msg.data(using: String.Encoding.utf8)
        socket?.write(data, withTimeout: 30, tag: 1)
    }
    
}
