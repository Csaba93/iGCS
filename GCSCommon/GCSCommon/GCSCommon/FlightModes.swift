//
//  FlightModes.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2017. 01. 25..
//  Copyright © 2017. csaba.nadasi. All rights reserved.
//

import UIKit

class FlightModes: NSObject
{
    func flightMode () -> String
    {
        switch conn.heartBeat!.customMode()
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
}
