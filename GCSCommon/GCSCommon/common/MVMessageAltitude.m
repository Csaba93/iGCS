//
//  MVMessageAltitude.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAltitude.h"

@implementation MVMessageAltitude

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec altitudeMonotonic:(float)altitudeMonotonic altitudeAmsl:(float)altitudeAmsl altitudeLocal:(float)altitudeLocal altitudeRelative:(float)altitudeRelative altitudeTerrain:(float)altitudeTerrain bottomClearance:(float)bottomClearance {
  if ((self = [super init])) {
    mavlink_msg_altitude_pack(systemId, componentId, &(self->_message), timeUsec, altitudeMonotonic, altitudeAmsl, altitudeLocal, altitudeRelative, altitudeTerrain, bottomClearance);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_altitude_get_time_usec(&(self->_message));
}

- (float)altitudeMonotonic {
  return mavlink_msg_altitude_get_altitude_monotonic(&(self->_message));
}

- (float)altitudeAmsl {
  return mavlink_msg_altitude_get_altitude_amsl(&(self->_message));
}

- (float)altitudeLocal {
  return mavlink_msg_altitude_get_altitude_local(&(self->_message));
}

- (float)altitudeRelative {
  return mavlink_msg_altitude_get_altitude_relative(&(self->_message));
}

- (float)altitudeTerrain {
  return mavlink_msg_altitude_get_altitude_terrain(&(self->_message));
}

- (float)bottomClearance {
  return mavlink_msg_altitude_get_bottom_clearance(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, altitudeMonotonic=%f, altitudeAmsl=%f, altitudeLocal=%f, altitudeRelative=%f, altitudeTerrain=%f, bottomClearance=%f", [super description], [self timeUsec], [self altitudeMonotonic], [self altitudeAmsl], [self altitudeLocal], [self altitudeRelative], [self altitudeTerrain], [self bottomClearance]];
}

@end
