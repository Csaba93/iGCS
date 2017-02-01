//
//  MVMessageAdsbVehicle.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ADSB_VEHICLE Mavlink message.

 @discussion The location and information of an ADSB vehicle
 */
@interface MVMessageAdsbVehicle : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId ICAOAddress:(uint32_t)ICAOAddress lat:(int32_t)lat lon:(int32_t)lon altitudeType:(ADSB_ALTITUDE_TYPE)altitudeType altitude:(int32_t)altitude heading:(uint16_t)heading horVelocity:(uint16_t)horVelocity verVelocity:(int16_t)verVelocity callsign:(char *)callsign emitterType:(ADSB_EMITTER_TYPE)emitterType tslc:(uint8_t)tslc flags:(ADSB_FLAGS)flags squawk:(uint16_t)squawk;

//! ICAO address
- (uint32_t)ICAOAddress;

//! Latitude, expressed as degrees * 1E7
- (int32_t)lat;

//! Longitude, expressed as degrees * 1E7
- (int32_t)lon;

//! Type from ADSB_ALTITUDE_TYPE enum
- (ADSB_ALTITUDE_TYPE)altitudeType;

//! Altitude(ASL) in millimeters
- (int32_t)altitude;

//! Course over ground in centidegrees
- (uint16_t)heading;

//! The horizontal velocity in centimeters/second
- (uint16_t)horVelocity;

//! The vertical velocity in centimeters/second, positive is up
- (int16_t)verVelocity;

//! The callsign, 8+null
- (NSString *)callsign;

//! Type from ADSB_EMITTER_TYPE enum
- (ADSB_EMITTER_TYPE)emitterType;

//! Time since last communication in seconds
- (uint8_t)tslc;

//! Flags to indicate various statuses including valid data fields
- (ADSB_FLAGS)flags;

//! Squawk code
- (uint16_t)squawk;

@end
