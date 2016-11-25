//
//  ViewController.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2016. 11. 23..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var conn = Connection()
    var msg: String? = nil
    var timer = Timer()

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conn.connection(server: "172.19.99.160", port: 5760)
        //172.19.99.160,192.168.1.103
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(textViewrefresh), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func sendButton(_ sender: Any) {
        if(textField.text != "")
        {
            let message = textField.text! + "\n"
            conn.sendMessage(msg: message)
            textField.text = ""
        }
    }

    @IBAction func sendMavlink(_ sender: Any) {
        conn.sendm()
    }
    
    func textViewrefresh()
    {
        DispatchQueue.main.async
        {
            /*if(self.conn.msg?.text() != self.msg!)
            {
                self.textView.text = self.textView.text! + (self.conn.msg?.text())! + "\n"
                self.msg = self.conn.msg?.text()
            }*/
            self.textView.text = ""
            for i in self.conn.statusTextarray
            {
                self.textView.text = self.textView.text! + i + "\n"
            }
            
            if (self.conn.globalPosition?.lat() != nil)
            {
                self.latLabel.text = "Lat: " + String(describing: self.conn.globalPosition!.lat())
                self.longLabel.text = "Lon: " + String(describing: self.conn.globalPosition!.lon())
            }
         }
    }
}

