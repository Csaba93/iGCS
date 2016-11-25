//
//  MVMessageManualControl.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageManualControl.h"

@implementation MVMessageManualControl

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId target:(uint8_t)target x:(int16_t)x y:(int16_t)y z:(int16_t)z r:(int16_t)r buttons:(uint16_t)buttons {
  if ((self = [super init])) {
    mavlink_msg_manual_control_pack(systemId, componentId, &(self->_message), target, x, y, z, r, buttons);
  }
  return self;
}

- (uint8_t)target {
  return mavlink_msg_manual_control_get_target(&(self->_message));
}

- (int16_t)x {
  return mavlink_msg_manual_control_get_x(&(self->_message));
}

- (int16_t)y {
  return mavlink_msg_manual_control_get_y(&(self->_message));
}

- (int16_t)z {
  return mavlink_msg_manual_control_get_z(&(self->_message));
}

- (int16_t)r {
  return mavlink_msg_manual_control_get_r(&(self->_message));
}

- (uint16_t)buttons {
  return mavlink_msg_manual_control_get_buttons(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, target=%d, x=%d, y=%d, z=%d, r=%d, buttons=%d", [super description], [self target], [self x], [self y], [self z], [self r], [self buttons]];
}

@end
