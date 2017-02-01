//
//  MVMessageAttitudeQuaternionCov.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ATTITUDE_QUATERNION_COV Mavlink message.

 @discussion The attitude in the aeronautical frame (right-handed, Z-down, X-front, Y-right), expressed as quaternion. Quaternion order is w, x, y, z and a zero rotation would be expressed as (1 0 0 0).
 */
@interface MVMessageAttitudeQuaternionCov : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec q:(float *)q rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed covariance:(float *)covariance;

//! Timestamp (microseconds since system boot or since UNIX epoch)
- (uint64_t)timeUsec;

//! Quaternion components, w, x, y, z (1 0 0 0 is the null-rotation)
- (uint16_t)q:(float *)q;

//! Roll angular speed (rad/s)
- (float)rollspeed;

//! Pitch angular speed (rad/s)
- (float)pitchspeed;

//! Yaw angular speed (rad/s)
- (float)yawspeed;

//! Attitude covariance
- (uint16_t)covariance:(float *)covariance;

@end
