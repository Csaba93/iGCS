//
//  MVMessageSerialControl.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSerialControl.h"

@implementation MVMessageSerialControl

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId device:(uint8_t)device flags:(uint8_t)flags timeout:(uint16_t)timeout baudrate:(uint32_t)baudrate count:(uint8_t)count data:(uint8_t *)data {
  if ((self = [super init])) {
    mavlink_msg_serial_control_pack(systemId, componentId, &(self->_message), device, flags, timeout, baudrate, count, data);
  }
  return self;
}

- (uint8_t)device {
  return mavlink_msg_serial_control_get_device(&(self->_message));
}

- (uint8_t)flags {
  return mavlink_msg_serial_control_get_flags(&(self->_message));
}

- (uint16_t)timeout {
  return mavlink_msg_serial_control_get_timeout(&(self->_message));
}

- (uint32_t)baudrate {
  return mavlink_msg_serial_control_get_baudrate(&(self->_message));
}

- (uint8_t)count {
  return mavlink_msg_serial_control_get_count(&(self->_message));
}

- (uint16_t)data:(uint8_t *)data {
  return mavlink_msg_serial_control_get_data(&(self->_message), data);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, device=%d, flags=%d, timeout=%d, baudrate=%d, count=%d, data=%@", [super description], [self device], [self flags], [self timeout], [self baudrate], [self count], @"[array of uint8_t[70]]"];
}

@end
