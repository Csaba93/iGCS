//
//  MVMessageDataTransmissionHandshake.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageDataTransmissionHandshake.h"

@implementation MVMessageDataTransmissionHandshake

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId type:(uint8_t)type size:(uint32_t)size width:(uint16_t)width height:(uint16_t)height packets:(uint16_t)packets payload:(uint8_t)payload jpgQuality:(uint8_t)jpgQuality {
  if ((self = [super init])) {
    mavlink_msg_data_transmission_handshake_pack(systemId, componentId, &(self->_message), type, size, width, height, packets, payload, jpgQuality);
  }
  return self;
}

- (uint8_t)type {
  return mavlink_msg_data_transmission_handshake_get_type(&(self->_message));
}

- (uint32_t)size {
  return mavlink_msg_data_transmission_handshake_get_size(&(self->_message));
}

- (uint16_t)width {
  return mavlink_msg_data_transmission_handshake_get_width(&(self->_message));
}

- (uint16_t)height {
  return mavlink_msg_data_transmission_handshake_get_height(&(self->_message));
}

- (uint16_t)packets {
  return mavlink_msg_data_transmission_handshake_get_packets(&(self->_message));
}

- (uint8_t)payload {
  return mavlink_msg_data_transmission_handshake_get_payload(&(self->_message));
}

- (uint8_t)jpgQuality {
  return mavlink_msg_data_transmission_handshake_get_jpg_quality(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, type=%d, size=%d, width=%d, height=%d, packets=%d, payload=%d, jpgQuality=%d", [super description], [self type], [self size], [self width], [self height], [self packets], [self payload], [self jpgQuality]];
}

@end
