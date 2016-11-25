//
//  MVMessageHighresImu.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIGHRES_IMU Mavlink message.

 @discussion The IMU readings in SI units in NED body frame
 */
@interface MVMessageHighresImu : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec xacc:(float)xacc yacc:(float)yacc zacc:(float)zacc xgyro:(float)xgyro ygyro:(float)ygyro zgyro:(float)zgyro xmag:(float)xmag ymag:(float)ymag zmag:(float)zmag absPressure:(float)absPressure diffPressure:(float)diffPressure pressureAlt:(float)pressureAlt temperature:(float)temperature fieldsUpdated:(uint16_t)fieldsUpdated;

//! Timestamp (microseconds, synced to UNIX time or since system boot)
- (uint64_t)timeUsec;

//! X acceleration (m/s^2)
- (float)xacc;

//! Y acceleration (m/s^2)
- (float)yacc;

//! Z acceleration (m/s^2)
- (float)zacc;

//! Angular speed around X axis (rad / sec)
- (float)xgyro;

//! Angular speed around Y axis (rad / sec)
- (float)ygyro;

//! Angular speed around Z axis (rad / sec)
- (float)zgyro;

//! X Magnetic field (Gauss)
- (float)xmag;

//! Y Magnetic field (Gauss)
- (float)ymag;

//! Z Magnetic field (Gauss)
- (float)zmag;

//! Absolute pressure in millibar
- (float)absPressure;

//! Differential pressure in millibar
- (float)diffPressure;

//! Altitude calculated from pressure
- (float)pressureAlt;

//! Temperature in degrees celsius
- (float)temperature;

//! Bitmask for fields that have updated since last message, bit 0 = xacc, bit 12: temperature
- (uint16_t)fieldsUpdated;

@end
