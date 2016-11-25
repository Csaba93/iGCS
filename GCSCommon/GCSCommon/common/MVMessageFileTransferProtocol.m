//
//  MVMessageFileTransferProtocol.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageFileTransferProtocol.h"

@implementation MVMessageFileTransferProtocol

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetNetwork:(uint8_t)targetNetwork targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent payload:(uint8_t *)payload {
  if ((self = [super init])) {
    mavlink_msg_file_transfer_protocol_pack(systemId, componentId, &(self->_message), targetNetwork, targetSystem, targetComponent, payload);
  }
  return self;
}

- (uint8_t)targetNetwork {
  return mavlink_msg_file_transfer_protocol_get_target_network(&(self->_message));
}

- (uint8_t)targetSystem {
  return mavlink_msg_file_transfer_protocol_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_file_transfer_protocol_get_target_component(&(self->_message));
}

- (uint16_t)payload:(uint8_t *)payload {
  return mavlink_msg_file_transfer_protocol_get_payload(&(self->_message), payload);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetNetwork=%d, targetSystem=%d, targetComponent=%d, payload=%@", [super description], [self targetNetwork], [self targetSystem], [self targetComponent], @"[array of uint8_t[251]]"];
}

@end
