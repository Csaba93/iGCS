//
//  LogViewController.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2016. 12. 01..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//

import UIKit

class LogViewController: UIViewController
{
    var timer = Timer()
    
    @IBOutlet weak var logTextView: UITextView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(logTextViewRefresh), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func logTextViewRefresh()
    {
        for message in conn.statusTextArray
        {
            self.logTextView.text = self.logTextView.text! + message + "\n"
        }
    }
}
