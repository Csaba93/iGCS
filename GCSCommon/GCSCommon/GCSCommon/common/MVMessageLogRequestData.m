//
//  MVMessageLogRequestData.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogRequestData.h"

@implementation MVMessageLogRequestData

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent id:(uint16_t)id ofs:(uint32_t)ofs count:(uint32_t)count {
  if ((self = [super init])) {
    mavlink_msg_log_request_data_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, id, ofs, count);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_log_request_data_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_log_request_data_get_target_component(&(self->_message));
}

- (uint16_t)id {
  return mavlink_msg_log_request_data_get_id(&(self->_message));
}

- (uint32_t)ofs {
  return mavlink_msg_log_request_data_get_ofs(&(self->_message));
}

- (uint32_t)count {
  return mavlink_msg_log_request_data_get_count(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, id=%d, ofs=%d, count=%d", [super description], [self targetSystem], [self targetComponent], [self id], [self ofs], [self count]];
}

@end
