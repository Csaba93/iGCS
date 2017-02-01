//
//  ConnectionViewController.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2016. 11. 30..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//

import UIKit

class ConnectionViewController: UIViewController
{
    @IBOutlet weak var ipTextField: UITextField!
    @IBOutlet weak var portTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ConnectButton(_ sender: Any)
    {
        if (ipTextField.text != "" && portTextField.text != "")
        {
            conn.connection(server: ipTextField.text!, port: Int(portTextField.text!)!)
        }
    }
}
