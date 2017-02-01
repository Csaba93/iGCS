//
//  MVMessageV2Extension.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageV2Extension.h"

@implementation MVMessageV2Extension

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetNetwork:(uint8_t)targetNetwork targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent messageType:(uint16_t)messageType payload:(uint8_t *)payload {
  if ((self = [super init])) {
    mavlink_msg_v2_extension_pack(systemId, componentId, &(self->_message), targetNetwork, targetSystem, targetComponent, messageType, payload);
  }
  return self;
}

- (uint8_t)targetNetwork {
  return mavlink_msg_v2_extension_get_target_network(&(self->_message));
}

- (uint8_t)targetSystem {
  return mavlink_msg_v2_extension_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_v2_extension_get_target_component(&(self->_message));
}

- (uint16_t)messageType {
  return mavlink_msg_v2_extension_get_message_type(&(self->_message));
}

- (uint16_t)payload:(uint8_t *)payload {
  return mavlink_msg_v2_extension_get_payload(&(self->_message), payload);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetNetwork=%d, targetSystem=%d, targetComponent=%d, messageType=%d, payload=%@", [super description], [self targetNetwork], [self targetSystem], [self targetComponent], [self messageType], @"[array of uint8_t[249]]"];
}

@end
