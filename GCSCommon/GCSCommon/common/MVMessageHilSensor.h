//
//  MVMessageHilSensor.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIL_SENSOR Mavlink message.

 @discussion The IMU readings in SI units in NED body frame
 */
@interface MVMessageHilSensor : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec xacc:(float)xacc yacc:(float)yacc zacc:(float)zacc xgyro:(float)xgyro ygyro:(float)ygyro zgyro:(float)zgyro xmag:(float)xmag ymag:(float)ymag zmag:(float)zmag absPressure:(float)absPressure diffPressure:(float)diffPressure pressureAlt:(float)pressureAlt temperature:(float)temperature fieldsUpdated:(uint32_t)fieldsUpdated;

//! Timestamp (microseconds, synced to UNIX time or since system boot)
- (uint64_t)timeUsec;

//! X acceleration (m/s^2)
- (float)xacc;

//! Y acceleration (m/s^2)
- (float)yacc;

//! Z acceleration (m/s^2)
- (float)zacc;

//! Angular speed around X axis in body frame (rad / sec)
- (float)xgyro;

//! Angular speed around Y axis in body frame (rad / sec)
- (float)ygyro;

//! Angular speed around Z axis in body frame (rad / sec)
- (float)zgyro;

//! X Magnetic field (Gauss)
- (float)xmag;

//! Y Magnetic field (Gauss)
- (float)ymag;

//! Z Magnetic field (Gauss)
- (float)zmag;

//! Absolute pressure in millibar
- (float)absPressure;

//! Differential pressure (airspeed) in millibar
- (float)diffPressure;

//! Altitude calculated from pressure
- (float)pressureAlt;

//! Temperature in degrees celsius
- (float)temperature;

//! Bitmask for fields that have updated since last message, bit 0 = xacc, bit 12: temperature, bit 31: full reset of attitude/position/velocities/etc was performed in sim.
- (uint32_t)fieldsUpdated;

@end
