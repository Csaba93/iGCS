//
//  MVMessageAdsbVehicle.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAdsbVehicle.h"

@implementation MVMessageAdsbVehicle

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId ICAOAddress:(uint32_t)ICAOAddress lat:(int32_t)lat lon:(int32_t)lon altitudeType:(ADSB_ALTITUDE_TYPE)altitudeType altitude:(int32_t)altitude heading:(uint16_t)heading horVelocity:(uint16_t)horVelocity verVelocity:(int16_t)verVelocity callsign:(char *)callsign emitterType:(ADSB_EMITTER_TYPE)emitterType tslc:(uint8_t)tslc flags:(ADSB_FLAGS)flags squawk:(uint16_t)squawk {
  if ((self = [super init])) {
    mavlink_msg_adsb_vehicle_pack(systemId, componentId, &(self->_message), ICAOAddress, lat, lon, altitudeType, altitude, heading, horVelocity, verVelocity, callsign, emitterType, tslc, flags, squawk);
  }
  return self;
}

- (uint32_t)ICAOAddress {
  return mavlink_msg_adsb_vehicle_get_ICAO_address(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_adsb_vehicle_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_adsb_vehicle_get_lon(&(self->_message));
}

- (ADSB_ALTITUDE_TYPE)altitudeType {
  return mavlink_msg_adsb_vehicle_get_altitude_type(&(self->_message));
}

- (int32_t)altitude {
  return mavlink_msg_adsb_vehicle_get_altitude(&(self->_message));
}

- (uint16_t)heading {
  return mavlink_msg_adsb_vehicle_get_heading(&(self->_message));
}

- (uint16_t)horVelocity {
  return mavlink_msg_adsb_vehicle_get_hor_velocity(&(self->_message));
}

- (int16_t)verVelocity {
  return mavlink_msg_adsb_vehicle_get_ver_velocity(&(self->_message));
}

- (NSString *)callsign {
  char string[9];
  mavlink_msg_adsb_vehicle_get_callsign(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:9 encoding:NSASCIIStringEncoding];
}

- (ADSB_EMITTER_TYPE)emitterType {
  return mavlink_msg_adsb_vehicle_get_emitter_type(&(self->_message));
}

- (uint8_t)tslc {
  return mavlink_msg_adsb_vehicle_get_tslc(&(self->_message));
}

- (ADSB_FLAGS)flags {
  return mavlink_msg_adsb_vehicle_get_flags(&(self->_message));
}

- (uint16_t)squawk {
  return mavlink_msg_adsb_vehicle_get_squawk(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, ICAOAddress=%d, lat=%d, lon=%d, altitudeType=%d, altitude=%d, heading=%d, horVelocity=%d, verVelocity=%d, callsign=%@, emitterType=%d, tslc=%d, flags=%d, squawk=%d", [super description], [self ICAOAddress], [self lat], [self lon], [self altitudeType], [self altitude], [self heading], [self horVelocity], [self verVelocity], [self callsign], [self emitterType], [self tslc], [self flags], [self squawk]];
}

@end
