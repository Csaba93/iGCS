//
//  MVMessageManualSetpoint.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MANUAL_SETPOINT Mavlink message.

 @discussion Setpoint in roll, pitch, yaw and thrust from the operator
 */
@interface MVMessageManualSetpoint : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust modeSwitch:(uint8_t)modeSwitch manualOverrideSwitch:(uint8_t)manualOverrideSwitch;

//! Timestamp in milliseconds since system boot
- (uint32_t)timeBootMs;

//! Desired roll rate in radians per second
- (float)roll;

//! Desired pitch rate in radians per second
- (float)pitch;

//! Desired yaw rate in radians per second
- (float)yaw;

//! Collective thrust, normalized to 0 .. 1
- (float)thrust;

//! Flight mode switch position, 0.. 255
- (uint8_t)modeSwitch;

//! Override mode switch position, 0.. 255
- (uint8_t)manualOverrideSwitch;

@end
