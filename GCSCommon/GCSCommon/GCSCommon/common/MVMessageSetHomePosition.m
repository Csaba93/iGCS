//
//  MVMessageSetHomePosition.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetHomePosition.h"

@implementation MVMessageSetHomePosition

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem latitude:(int32_t)latitude longitude:(int32_t)longitude altitude:(int32_t)altitude x:(float)x y:(float)y z:(float)z q:(float *)q approachX:(float)approachX approachY:(float)approachY approachZ:(float)approachZ {
  if ((self = [super init])) {
    mavlink_msg_set_home_position_pack(systemId, componentId, &(self->_message), targetSystem, latitude, longitude, altitude, x, y, z, q, approachX, approachY, approachZ);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_home_position_get_target_system(&(self->_message));
}

- (int32_t)latitude {
  return mavlink_msg_set_home_position_get_latitude(&(self->_message));
}

- (int32_t)longitude {
  return mavlink_msg_set_home_position_get_longitude(&(self->_message));
}

- (int32_t)altitude {
  return mavlink_msg_set_home_position_get_altitude(&(self->_message));
}

- (float)x {
  return mavlink_msg_set_home_position_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_set_home_position_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_set_home_position_get_z(&(self->_message));
}

- (uint16_t)q:(float *)q {
  return mavlink_msg_set_home_position_get_q(&(self->_message), q);
}

- (float)approachX {
  return mavlink_msg_set_home_position_get_approach_x(&(self->_message));
}

- (float)approachY {
  return mavlink_msg_set_home_position_get_approach_y(&(self->_message));
}

- (float)approachZ {
  return mavlink_msg_set_home_position_get_approach_z(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, latitude=%d, longitude=%d, altitude=%d, x=%f, y=%f, z=%f, q=%@, approachX=%f, approachY=%f, approachZ=%f", [super description], [self targetSystem], [self latitude], [self longitude], [self altitude], [self x], [self y], [self z], @"[array of float[4]]", [self approachX], [self approachY], [self approachZ]];
}

@end
