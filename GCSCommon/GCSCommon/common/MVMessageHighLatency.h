//
//  MVMessageHighLatency.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIGH_LATENCY Mavlink message.

 @discussion Message appropriate for high latency connections like Iridium
 */
@interface MVMessageHighLatency : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId baseMode:(uint8_t)baseMode customMode:(uint32_t)customMode landedState:(MAV_LANDED_STATE)landedState roll:(int16_t)roll pitch:(int16_t)pitch heading:(uint16_t)heading throttle:(int8_t)throttle headingSp:(int16_t)headingSp latitude:(int32_t)latitude longitude:(int32_t)longitude altitudeAmsl:(int16_t)altitudeAmsl altitudeSp:(int16_t)altitudeSp airspeed:(uint8_t)airspeed airspeedSp:(uint8_t)airspeedSp groundspeed:(uint8_t)groundspeed climbRate:(int8_t)climbRate gpsNsat:(uint8_t)gpsNsat gpsFixType:(uint8_t)gpsFixType batteryRemaining:(uint8_t)batteryRemaining temperature:(int8_t)temperature temperatureAir:(int8_t)temperatureAir failsafe:(uint8_t)failsafe wpNum:(uint8_t)wpNum wpDistance:(uint16_t)wpDistance;

//! System mode bitfield, see MAV_MODE_FLAG ENUM in mavlink/include/mavlink_types.h
- (uint8_t)baseMode;

//! A bitfield for use for autopilot-specific flags.
- (uint32_t)customMode;

//! The landed state. Is set to MAV_LANDED_STATE_UNDEFINED if landed state is unknown.
- (MAV_LANDED_STATE)landedState;

//! roll (centidegrees)
- (int16_t)roll;

//! pitch (centidegrees)
- (int16_t)pitch;

//! heading (centidegrees)
- (uint16_t)heading;

//! throttle (percentage)
- (int8_t)throttle;

//! heading setpoint (centidegrees)
- (int16_t)headingSp;

//! Latitude, expressed as degrees * 1E7
- (int32_t)latitude;

//! Longitude, expressed as degrees * 1E7
- (int32_t)longitude;

//! Altitude above mean sea level (meters)
- (int16_t)altitudeAmsl;

//! Altitude setpoint relative to the home position (meters)
- (int16_t)altitudeSp;

//! airspeed (m/s)
- (uint8_t)airspeed;

//! airspeed setpoint (m/s)
- (uint8_t)airspeedSp;

//! groundspeed (m/s)
- (uint8_t)groundspeed;

//! climb rate (m/s)
- (int8_t)climbRate;

//! Number of satellites visible. If unknown, set to 255
- (uint8_t)gpsNsat;

//! See the GPS_FIX_TYPE enum.
- (uint8_t)gpsFixType;

//! Remaining battery (percentage)
- (uint8_t)batteryRemaining;

//! Autopilot temperature (degrees C)
- (int8_t)temperature;

//! Air temperature (degrees C) from airspeed sensor
- (int8_t)temperatureAir;

//! failsafe (each bit represents a failsafe where 0=ok, 1=failsafe active (bit0:RC, bit1:batt, bit2:GPS, bit3:GCS, bit4:fence)
- (uint8_t)failsafe;

//! current waypoint number
- (uint8_t)wpNum;

//! distance to target (meters)
- (uint16_t)wpDistance;

@end
