//
//  MVMessageGlobalPositionInt.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GLOBAL_POSITION_INT Mavlink message.

 @discussion The filtered global position (e.g. fused GPS and accelerometers). The position is in GPS-frame (right-handed, Z-up). It
               is designed as scaled integer message since the resolution of float is not sufficient.
 */
@interface MVMessageGlobalPositionInt : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt relativeAlt:(int32_t)relativeAlt vx:(int16_t)vx vy:(int16_t)vy vz:(int16_t)vz hdg:(uint16_t)hdg;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! Latitude, expressed as degrees * 1E7
- (int32_t)lat;

//! Longitude, expressed as degrees * 1E7
- (int32_t)lon;

//! Altitude in meters, expressed as * 1000 (millimeters), AMSL (not WGS84 - note that virtually all GPS modules provide the AMSL as well)
- (int32_t)alt;

//! Altitude above ground in meters, expressed as * 1000 (millimeters)
- (int32_t)relativeAlt;

//! Ground X Speed (Latitude, positive north), expressed as m/s * 100
- (int16_t)vx;

//! Ground Y Speed (Longitude, positive east), expressed as m/s * 100
- (int16_t)vy;

//! Ground Z Speed (Altitude, positive down), expressed as m/s * 100
- (int16_t)vz;

//! Vehicle heading (yaw angle) in degrees * 100, 0.0..359.99 degrees. If unknown, set to: UINT16_MAX
- (uint16_t)hdg;

@end
