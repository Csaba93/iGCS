//
//  MVMessageSetPositionTargetLocalNed.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_POSITION_TARGET_LOCAL_NED Mavlink message.

 @discussion Sets a desired vehicle position in a local north-east-down coordinate frame. Used by an external controller to command the vehicle (manual controller or other system).
 */
@interface MVMessageSetPositionTargetLocalNed : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent coordinateFrame:(MAV_FRAME)coordinateFrame typeMask:(uint16_t)typeMask x:(float)x y:(float)y z:(float)z vx:(float)vx vy:(float)vy vz:(float)vz afx:(float)afx afy:(float)afy afz:(float)afz yaw:(float)yaw yawRate:(float)yawRate;

//! Timestamp in milliseconds since system boot
- (uint32_t)timeBootMs;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Valid options are: MAV_FRAME_LOCAL_NED = 1, MAV_FRAME_LOCAL_OFFSET_NED = 7, MAV_FRAME_BODY_NED = 8, MAV_FRAME_BODY_OFFSET_NED = 9
- (MAV_FRAME)coordinateFrame;

//! Bitmask to indicate which dimensions should be ignored by the vehicle: a value of 0b0000000000000000 or 0b0000001000000000 indicates that none of the setpoint dimensions should be ignored. If bit 10 is set the floats afx afy afz should be interpreted as force instead of acceleration. Mapping: bit 1: x, bit 2: y, bit 3: z, bit 4: vx, bit 5: vy, bit 6: vz, bit 7: ax, bit 8: ay, bit 9: az, bit 10: is force setpoint, bit 11: yaw, bit 12: yaw rate
- (uint16_t)typeMask;

//! X Position in NED frame in meters
- (float)x;

//! Y Position in NED frame in meters
- (float)y;

//! Z Position in NED frame in meters (note, altitude is negative in NED)
- (float)z;

//! X velocity in NED frame in meter / s
- (float)vx;

//! Y velocity in NED frame in meter / s
- (float)vy;

//! Z velocity in NED frame in meter / s
- (float)vz;

//! X acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
- (float)afx;

//! Y acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
- (float)afy;

//! Z acceleration or force (if bit 10 of type_mask is set) in NED frame in meter / s^2 or N
- (float)afz;

//! yaw setpoint in rad
- (float)yaw;

//! yaw rate setpoint in rad/s
- (float)yawRate;

@end
