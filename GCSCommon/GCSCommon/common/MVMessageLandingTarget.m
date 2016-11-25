//
//  MVMessageLandingTarget.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLandingTarget.h"

@implementation MVMessageLandingTarget

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec targetNum:(uint8_t)targetNum frame:(uint8_t)frame angleX:(float)angleX angleY:(float)angleY distance:(float)distance sizeX:(float)sizeX sizeY:(float)sizeY {
  if ((self = [super init])) {
    mavlink_msg_landing_target_pack(systemId, componentId, &(self->_message), timeUsec, targetNum, frame, angleX, angleY, distance, sizeX, sizeY);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_landing_target_get_time_usec(&(self->_message));
}

- (uint8_t)targetNum {
  return mavlink_msg_landing_target_get_target_num(&(self->_message));
}

- (uint8_t)frame {
  return mavlink_msg_landing_target_get_frame(&(self->_message));
}

- (float)angleX {
  return mavlink_msg_landing_target_get_angle_x(&(self->_message));
}

- (float)angleY {
  return mavlink_msg_landing_target_get_angle_y(&(self->_message));
}

- (float)distance {
  return mavlink_msg_landing_target_get_distance(&(self->_message));
}

- (float)sizeX {
  return mavlink_msg_landing_target_get_size_x(&(self->_message));
}

- (float)sizeY {
  return mavlink_msg_landing_target_get_size_y(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, targetNum=%d, frame=%d, angleX=%f, angleY=%f, distance=%f, sizeX=%f, sizeY=%f", [super description], [self timeUsec], [self targetNum], [self frame], [self angleX], [self angleY], [self distance], [self sizeX], [self sizeY]];
}

@end
