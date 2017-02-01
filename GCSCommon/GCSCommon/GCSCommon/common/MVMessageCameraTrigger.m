//
//  MVMessageCameraTrigger.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageCameraTrigger.h"

@implementation MVMessageCameraTrigger

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec seq:(uint32_t)seq {
  if ((self = [super init])) {
    mavlink_msg_camera_trigger_pack(systemId, componentId, &(self->_message), timeUsec, seq);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_camera_trigger_get_time_usec(&(self->_message));
}

- (uint32_t)seq {
  return mavlink_msg_camera_trigger_get_seq(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, seq=%d", [super description], [self timeUsec], [self seq]];
}

@end
