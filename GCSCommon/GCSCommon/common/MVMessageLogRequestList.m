//
//  MVMessageLogRequestList.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogRequestList.h"

@implementation MVMessageLogRequestList

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent start:(uint16_t)start end:(uint16_t)end {
  if ((self = [super init])) {
    mavlink_msg_log_request_list_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, start, end);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_log_request_list_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_log_request_list_get_target_component(&(self->_message));
}

- (uint16_t)start {
  return mavlink_msg_log_request_list_get_start(&(self->_message));
}

- (uint16_t)end {
  return mavlink_msg_log_request_list_get_end(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, start=%d, end=%d", [super description], [self targetSystem], [self targetComponent], [self start], [self end]];
}

@end
