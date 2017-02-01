//
//  MVMessageHilStateQuaternion.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIL_STATE_QUATERNION Mavlink message.

 @discussion Sent from simulation to autopilot, avoids in contrast to HIL_STATE singularities. This packet is useful for high throughput applications such as hardware in the loop simulations.
 */
@interface MVMessageHilStateQuaternion : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec attitudeQuaternion:(float *)attitudeQuaternion rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt vx:(int16_t)vx vy:(int16_t)vy vz:(int16_t)vz indAirspeed:(uint16_t)indAirspeed trueAirspeed:(uint16_t)trueAirspeed xacc:(int16_t)xacc yacc:(int16_t)yacc zacc:(int16_t)zacc;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

//! Vehicle attitude expressed as normalized quaternion in w, x, y, z order (with 1 0 0 0 being the null-rotation)
- (uint16_t)attitudeQuaternion:(float *)attitude_quaternion;

//! Body frame roll / phi angular speed (rad/s)
- (float)rollspeed;

//! Body frame pitch / theta angular speed (rad/s)
- (float)pitchspeed;

//! Body frame yaw / psi angular speed (rad/s)
- (float)yawspeed;

//! Latitude, expressed as * 1E7
- (int32_t)lat;

//! Longitude, expressed as * 1E7
- (int32_t)lon;

//! Altitude in meters, expressed as * 1000 (millimeters)
- (int32_t)alt;

//! Ground X Speed (Latitude), expressed as m/s * 100
- (int16_t)vx;

//! Ground Y Speed (Longitude), expressed as m/s * 100
- (int16_t)vy;

//! Ground Z Speed (Altitude), expressed as m/s * 100
- (int16_t)vz;

//! Indicated airspeed, expressed as m/s * 100
- (uint16_t)indAirspeed;

//! True airspeed, expressed as m/s * 100
- (uint16_t)trueAirspeed;

//! X acceleration (mg)
- (int16_t)xacc;

//! Y acceleration (mg)
- (int16_t)yacc;

//! Z acceleration (mg)
- (int16_t)zacc;

@end
