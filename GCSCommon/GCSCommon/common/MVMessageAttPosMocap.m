//
//  MVMessageAttPosMocap.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAttPosMocap.h"

@implementation MVMessageAttPosMocap

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec q:(float *)q x:(float)x y:(float)y z:(float)z {
  if ((self = [super init])) {
    mavlink_msg_att_pos_mocap_pack(systemId, componentId, &(self->_message), timeUsec, q, x, y, z);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_att_pos_mocap_get_time_usec(&(self->_message));
}

- (uint16_t)q:(float *)q {
  return mavlink_msg_att_pos_mocap_get_q(&(self->_message), q);
}

- (float)x {
  return mavlink_msg_att_pos_mocap_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_att_pos_mocap_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_att_pos_mocap_get_z(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, q=%@, x=%f, y=%f, z=%f", [super description], [self timeUsec], @"[array of float[4]]", [self x], [self y], [self z]];
}

@end
