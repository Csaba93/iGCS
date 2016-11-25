//
//  MVMessageCollision.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageCollision.h"

@implementation MVMessageCollision

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId src:(MAV_COLLISION_SRC)src id:(uint32_t)id action:(MAV_COLLISION_ACTION)action threatLevel:(MAV_COLLISION_THREAT_LEVEL)threatLevel timeToMinimumDelta:(float)timeToMinimumDelta altitudeMinimumDelta:(float)altitudeMinimumDelta horizontalMinimumDelta:(float)horizontalMinimumDelta {
  if ((self = [super init])) {
    mavlink_msg_collision_pack(systemId, componentId, &(self->_message), src, id, action, threatLevel, timeToMinimumDelta, altitudeMinimumDelta, horizontalMinimumDelta);
  }
  return self;
}

- (MAV_COLLISION_SRC)src {
  return mavlink_msg_collision_get_src(&(self->_message));
}

- (uint32_t)id {
  return mavlink_msg_collision_get_id(&(self->_message));
}

- (MAV_COLLISION_ACTION)action {
  return mavlink_msg_collision_get_action(&(self->_message));
}

- (MAV_COLLISION_THREAT_LEVEL)threatLevel {
  return mavlink_msg_collision_get_threat_level(&(self->_message));
}

- (float)timeToMinimumDelta {
  return mavlink_msg_collision_get_time_to_minimum_delta(&(self->_message));
}

- (float)altitudeMinimumDelta {
  return mavlink_msg_collision_get_altitude_minimum_delta(&(self->_message));
}

- (float)horizontalMinimumDelta {
  return mavlink_msg_collision_get_horizontal_minimum_delta(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, src=%d, id=%d, action=%d, threatLevel=%d, timeToMinimumDelta=%f, altitudeMinimumDelta=%f, horizontalMinimumDelta=%f", [super description], [self src], [self id], [self action], [self threatLevel], [self timeToMinimumDelta], [self altitudeMinimumDelta], [self horizontalMinimumDelta]];
}

@end
