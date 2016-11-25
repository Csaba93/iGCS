//
//  MVMessageVibration.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageVibration.h"

@implementation MVMessageVibration

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec vibrationX:(float)vibrationX vibrationY:(float)vibrationY vibrationZ:(float)vibrationZ clipping0:(uint32_t)clipping0 clipping1:(uint32_t)clipping1 clipping2:(uint32_t)clipping2 {
  if ((self = [super init])) {
    mavlink_msg_vibration_pack(systemId, componentId, &(self->_message), timeUsec, vibrationX, vibrationY, vibrationZ, clipping0, clipping1, clipping2);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_vibration_get_time_usec(&(self->_message));
}

- (float)vibrationX {
  return mavlink_msg_vibration_get_vibration_x(&(self->_message));
}

- (float)vibrationY {
  return mavlink_msg_vibration_get_vibration_y(&(self->_message));
}

- (float)vibrationZ {
  return mavlink_msg_vibration_get_vibration_z(&(self->_message));
}

- (uint32_t)clipping0 {
  return mavlink_msg_vibration_get_clipping_0(&(self->_message));
}

- (uint32_t)clipping1 {
  return mavlink_msg_vibration_get_clipping_1(&(self->_message));
}

- (uint32_t)clipping2 {
  return mavlink_msg_vibration_get_clipping_2(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, vibrationX=%f, vibrationY=%f, vibrationZ=%f, clipping0=%d, clipping1=%d, clipping2=%d", [super description], [self timeUsec], [self vibrationX], [self vibrationY], [self vibrationZ], [self clipping0], [self clipping1], [self clipping2]];
}

@end
