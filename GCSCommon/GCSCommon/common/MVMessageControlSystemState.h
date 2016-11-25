//
//  MVMessageControlSystemState.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a CONTROL_SYSTEM_STATE Mavlink message.

 @discussion The smoothed, monotonic system state used to feed the control loops of the system.
 */
@interface MVMessageControlSystemState : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec xAcc:(float)xAcc yAcc:(float)yAcc zAcc:(float)zAcc xVel:(float)xVel yVel:(float)yVel zVel:(float)zVel xPos:(float)xPos yPos:(float)yPos zPos:(float)zPos airspeed:(float)airspeed velVariance:(float *)velVariance posVariance:(float *)posVariance q:(float *)q rollRate:(float)rollRate pitchRate:(float)pitchRate yawRate:(float)yawRate;

//! Timestamp (micros since boot or Unix epoch)
- (uint64_t)timeUsec;

//! X acceleration in body frame
- (float)xAcc;

//! Y acceleration in body frame
- (float)yAcc;

//! Z acceleration in body frame
- (float)zAcc;

//! X velocity in body frame
- (float)xVel;

//! Y velocity in body frame
- (float)yVel;

//! Z velocity in body frame
- (float)zVel;

//! X position in local frame
- (float)xPos;

//! Y position in local frame
- (float)yPos;

//! Z position in local frame
- (float)zPos;

//! Airspeed, set to -1 if unknown
- (float)airspeed;

//! Variance of body velocity estimate
- (uint16_t)velVariance:(float *)vel_variance;

//! Variance in local position
- (uint16_t)posVariance:(float *)pos_variance;

//! The attitude, represented as Quaternion
- (uint16_t)q:(float *)q;

//! Angular rate in roll axis
- (float)rollRate;

//! Angular rate in pitch axis
- (float)pitchRate;

//! Angular rate in yaw axis
- (float)yawRate;

@end
