//
//  MVMessageGps2Raw.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS2_RAW Mavlink message.

 @discussion Second GPS data. Coordinate frame is right-handed, Z-axis up (GPS frame).
 */
@interface MVMessageGps2Raw : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec fixType:(GPS_FIX_TYPE)fixType lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt eph:(uint16_t)eph epv:(uint16_t)epv vel:(uint16_t)vel cog:(uint16_t)cog satellitesVisible:(uint8_t)satellitesVisible dgpsNumch:(uint8_t)dgpsNumch dgpsAge:(uint32_t)dgpsAge;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

//! See the GPS_FIX_TYPE enum.
- (GPS_FIX_TYPE)fixType;

//! Latitude (WGS84), in degrees * 1E7
- (int32_t)lat;

//! Longitude (WGS84), in degrees * 1E7
- (int32_t)lon;

//! Altitude (AMSL, not WGS84), in meters * 1000 (positive for up)
- (int32_t)alt;

//! GPS HDOP horizontal dilution of position in cm (m*100). If unknown, set to: UINT16_MAX
- (uint16_t)eph;

//! GPS VDOP vertical dilution of position in cm (m*100). If unknown, set to: UINT16_MAX
- (uint16_t)epv;

//! GPS ground speed (m/s * 100). If unknown, set to: UINT16_MAX
- (uint16_t)vel;

//! Course over ground (NOT heading, but direction of movement) in degrees * 100, 0.0..359.99 degrees. If unknown, set to: UINT16_MAX
- (uint16_t)cog;

//! Number of satellites visible. If unknown, set to 255
- (uint8_t)satellitesVisible;

//! Number of DGPS satellites
- (uint8_t)dgpsNumch;

//! Age of DGPS info
- (uint32_t)dgpsAge;

@end
