//
//  MissionItems.swift
//  GCSCommon
//
//  Created by Csaba Nádasi on 2017. 01. 25..
//  Copyright © 2017. csaba.nadasi. All rights reserved.
//

import UIKit

class MissionCommands: NSObject
{
    // MARK: - Armer-disarmer
    
    func armDisarm()
    {
        var msg : MVMessageCommandLong?
        
        if  ((conn.heartBeat!.baseMode() & 128) == 0)
        {
            msg = MVMessageCommandLong(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, command: MAV_CMD_COMPONENT_ARM_DISARM, confirmation: 0, param1: 1, param2: 0, param3: 0, param4: 0, param5: 0, param6: 0, param7: 0)
        }else
        {
            msg = MVMessageCommandLong(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, command: MAV_CMD_COMPONENT_ARM_DISARM, confirmation: 0, param1: 0, param2: 0, param3: 0, param4: 0, param5: 0, param6: 0, param7: 0)
        }
        conn.message.send(msg)
    }
    
    // MARK: - Mission starter
    
    func missionStart()
    {
        let currentMission = MVMessageMissionSetCurrent(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, seq: 1)
        conn.message.send(currentMission)
        
        let startMission = MVMessageCommandLong(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, command: MAV_CMD_MISSION_START, confirmation: 0, param1: 1, param2: 6, param3: 0, param4: 0, param5: 0, param6: 0, param7: 0)
        conn.message.send(startMission)
    }
    
    // MARK: - Item functions
    
    func getTheNumberOfItems()
    {
        let getTheNumberOfItems = MVMessageMissionRequestList(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0)
        conn.message.send(getTheNumberOfItems)
    }
    
    func getTheMissionItems()
    {
        if conn.numberOfItem?.count() != nil
        {
            var index = 0
            while index < Int(conn.numberOfItem!.count())
            {
                let getTheItems = MVMessageMissionRequest(systemId: 254, componentId: 0, targetSystem: 1, targetComponent: 0, seq: UInt16(index))
                conn.message.send(getTheItems)
                index += 1
            }
        }
    }
}
