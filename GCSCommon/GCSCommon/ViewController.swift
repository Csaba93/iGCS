//
//  ViewController.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2016. 11. 23..
//  Copyright © 2016. csaba.nadasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var msg : String? = nil
    var timer = Timer()

    @IBOutlet weak var statusTextView: UITextView!
    @IBOutlet weak var latLabel : UILabel!
    @IBOutlet weak var longLabel : UILabel!
    @IBOutlet weak var relativeAltLabel: UILabel!
    @IBOutlet weak var absAltLabel: UILabel!
    @IBOutlet weak var airSpeedLabel: UILabel!
    @IBOutlet weak var groundSpeedLabel: UILabel!
    @IBOutlet weak var batteryStatusLabel: UILabel!
    @IBOutlet weak var flightModeLabel: UILabel!
    @IBOutlet weak var armDisarmLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(textViewrefresh), userInfo: nil, repeats: true)
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds)
        {
             conn.sendm()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
    /*@IBAction func sendButton(_ sender: Any) {
        if(textField.text != "")
        {
            let message = textField.text! + "\n"
            conn.sendMessage(msg: message)
            textField.text = ""
        }
    }*/

    override var shouldAutorotate: Bool
    {
        return true
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
            //self.statusTextView.text = ""
            for i in conn.statusTextArray
            {
                self.statusTextView.text = self.statusTextView.text! + i + "\n"
            }
            
            if (conn.globalPosition?.lat() != nil)
            {
                self.latLabel.text = "Lat: " + String(describing: Double(conn.globalPosition!.lat())/10000000.0)
                self.longLabel.text = "Lon: " + String(describing: Double(conn.globalPosition!.lon())/10000000.0)
            }
        
            if (conn.globalPosition?.alt() != nil)
            {
                self.absAltLabel.text = "AMSL: " + String(describing: Int(conn.globalPosition!.alt())/1000)
                self.relativeAltLabel.text = "AGL: " + String(describing: Int(conn.globalPosition!.relativeAlt())/1000)
            }
            
            if (conn.vfrHud?.airspeed() != nil)
            {
               self.airSpeedLabel.text = "AS: " + String(describing: Int(conn.vfrHud!.airspeed())) + "m/s"
               self.groundSpeedLabel.text = "GS: " + String(describing: Int(conn.vfrHud!.groundspeed())) + "m/s"
            }
            
            if (conn.sysStatus?.batteryRemaining() != nil)
            {
                self.batteryStatusLabel.text = "Batt: " + String(describing: conn.sysStatus!.batteryRemaining()) + " %"
            }
            
            if (conn.heartBeat?.customMode() != nil)
            {
                self.flightModeLabel.text = conn.flightMode()
                
                if((conn.heartBeat!.baseMode() & 128) == 0)
                {
                    self.armDisarmLabel.text = "DISARM"
                }else
                {
                    self.armDisarmLabel.text = "ARM"
                }
            }
        }
    }

    @IBAction func armDisarmAction(_ sender: Any)
    {
        conn.armDisarm()
    }
    
    @IBAction func startMissionAction(_ sender: Any)
    {
        conn.missionStart()
    }
    
}

