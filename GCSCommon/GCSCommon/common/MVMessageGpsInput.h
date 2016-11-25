//
//  MVMessageGpsInput.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS_INPUT Mavlink message.

 @discussion GPS sensor input message.  This is a raw sensor value sent by the GPS. This is NOT the global position estimate of the sytem.
 */
@interface MVMessageGpsInput : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec gpsId:(uint8_t)gpsId ignoreFlags:(GPS_INPUT_IGNORE_FLAGS)ignoreFlags timeWeekMs:(uint32_t)timeWeekMs timeWeek:(uint16_t)timeWeek fixType:(uint8_t)fixType lat:(int32_t)lat lon:(int32_t)lon alt:(float)alt hdop:(float)hdop vdop:(float)vdop vn:(float)vn ve:(float)ve vd:(float)vd speedAccuracy:(float)speedAccuracy horizAccuracy:(float)horizAccuracy vertAccuracy:(float)vertAccuracy satellitesVisible:(uint8_t)satellitesVisible;

//! Timestamp (micros since boot or Unix epoch)
- (uint64_t)timeUsec;

//! ID of the GPS for multiple GPS inputs
- (uint8_t)gpsId;

//! Flags indicating which fields to ignore (see GPS_INPUT_IGNORE_FLAGS enum).  All other fields must be provided.
- (GPS_INPUT_IGNORE_FLAGS)ignoreFlags;

//! GPS time (milliseconds from start of GPS week)
- (uint32_t)timeWeekMs;

//! GPS week number
- (uint16_t)timeWeek;

//! 0-1: no fix, 2: 2D fix, 3: 3D fix. 4: 3D with DGPS. 5: 3D with RTK
- (uint8_t)fixType;

//! Latitude (WGS84), in degrees * 1E7
- (int32_t)lat;

//! Longitude (WGS84), in degrees * 1E7
- (int32_t)lon;

//! Altitude (AMSL, not WGS84), in m (positive for up)
- (float)alt;

//! GPS HDOP horizontal dilution of position in m
- (float)hdop;

//! GPS VDOP vertical dilution of position in m
- (float)vdop;

//! GPS velocity in m/s in NORTH direction in earth-fixed NED frame
- (float)vn;

//! GPS velocity in m/s in EAST direction in earth-fixed NED frame
- (float)ve;

//! GPS velocity in m/s in DOWN direction in earth-fixed NED frame
- (float)vd;

//! GPS speed accuracy in m/s
- (float)speedAccuracy;

//! GPS horizontal accuracy in m
- (float)horizAccuracy;

//! GPS vertical accuracy in m
- (float)vertAccuracy;

//! Number of satellites visible.
- (uint8_t)satellitesVisible;

@end
