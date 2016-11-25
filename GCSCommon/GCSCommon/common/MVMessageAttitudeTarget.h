//
//  MVMessageAttitudeTarget.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ATTITUDE_TARGET Mavlink message.

 @discussion Reports the current commanded attitude of the vehicle as specified by the autopilot. This should match the commands sent in a SET_ATTITUDE_TARGET message if the vehicle is being controlled this way.
 */
@interface MVMessageAttitudeTarget : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs typeMask:(uint8_t)typeMask q:(float *)q bodyRollRate:(float)bodyRollRate bodyPitchRate:(float)bodyPitchRate bodyYawRate:(float)bodyYawRate thrust:(float)thrust;

//! Timestamp in milliseconds since system boot
- (uint32_t)timeBootMs;

//! Mappings: If any of these bits are set, the corresponding input should be ignored: bit 1: body roll rate, bit 2: body pitch rate, bit 3: body yaw rate. bit 4-bit 7: reserved, bit 8: attitude
- (uint8_t)typeMask;

//! Attitude quaternion (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
- (uint16_t)q:(float *)q;

//! Body roll rate in radians per second
- (float)bodyRollRate;

//! Body roll rate in radians per second
- (float)bodyPitchRate;

//! Body roll rate in radians per second
- (float)bodyYawRate;

//! Collective thrust, normalized to 0 .. 1 (-1 .. 1 for vehicles capable of reverse trust)
- (float)thrust;

@end
