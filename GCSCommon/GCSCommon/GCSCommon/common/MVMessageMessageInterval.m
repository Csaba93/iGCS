//
//  MVMessageMessageInterval.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageMessageInterval.h"

@implementation MVMessageMessageInterval

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId messageId:(uint16_t)messageId intervalUs:(int32_t)intervalUs {
  if ((self = [super init])) {
    mavlink_msg_message_interval_pack(systemId, componentId, &(self->_message), messageId, intervalUs);
  }
  return self;
}

- (uint16_t)messageId {
  return mavlink_msg_message_interval_get_message_id(&(self->_message));
}

- (int32_t)intervalUs {
  return mavlink_msg_message_interval_get_interval_us(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, messageId=%d, intervalUs=%d", [super description], [self messageId], [self intervalUs]];
}

@end
