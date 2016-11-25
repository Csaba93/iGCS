//
//  MVMessagePowerStatus.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessagePowerStatus.h"

@implementation MVMessagePowerStatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId Vcc:(uint16_t)Vcc Vservo:(uint16_t)Vservo flags:(uint16_t)flags {
  if ((self = [super init])) {
    mavlink_msg_power_status_pack(systemId, componentId, &(self->_message), Vcc, Vservo, flags);
  }
  return self;
}

- (uint16_t)Vcc {
  return mavlink_msg_power_status_get_Vcc(&(self->_message));
}

- (uint16_t)Vservo {
  return mavlink_msg_power_status_get_Vservo(&(self->_message));
}

- (uint16_t)flags {
  return mavlink_msg_power_status_get_flags(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, Vcc=%d, Vservo=%d, flags=%d", [super description], [self Vcc], [self Vservo], [self flags]];
}

@end
