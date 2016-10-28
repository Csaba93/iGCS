//
//  ViewController.swift
//  GCSDemo
//
//  Created by Csaba Nádasi on 2016. 10. 27..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var conn = Connection()
    var msg: String? = nil
    var timer = Timer()
    
    @IBOutlet weak var resultField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conn.connection(server: "192.168.1.106", port: 5760)
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(textViewrefresh), userInfo: nil, repeats: true)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func sendButton(_ sender: AnyObject)
    {
       if(textField.text != "")
       {
        let message = textField.text! + "\n"
        conn.sendMessage(msg: message)
        textField.text = ""
       }
    }
    
    func textViewrefresh()
    {
        DispatchQueue.main.async {
            if(self.conn.msg != self.msg)
            {
                self.resultField.text = self.resultField.text! + self.conn.msg!
                self.msg = self.conn.msg
            }
        }
    }
}

