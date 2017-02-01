//
//  MVMessageManualSetpoint.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageManualSetpoint.h"

@implementation MVMessageManualSetpoint

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs roll:(float)roll pitch:(float)pitch yaw:(float)yaw thrust:(float)thrust modeSwitch:(uint8_t)modeSwitch manualOverrideSwitch:(uint8_t)manualOverrideSwitch {
  if ((self = [super init])) {
    mavlink_msg_manual_setpoint_pack(systemId, componentId, &(self->_message), timeBootMs, roll, pitch, yaw, thrust, modeSwitch, manualOverrideSwitch);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_manual_setpoint_get_time_boot_ms(&(self->_message));
}

- (float)roll {
  return mavlink_msg_manual_setpoint_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_manual_setpoint_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_manual_setpoint_get_yaw(&(self->_message));
}

- (float)thrust {
  return mavlink_msg_manual_setpoint_get_thrust(&(self->_message));
}

- (uint8_t)modeSwitch {
  return mavlink_msg_manual_setpoint_get_mode_switch(&(self->_message));
}

- (uint8_t)manualOverrideSwitch {
  return mavlink_msg_manual_setpoint_get_manual_override_switch(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, roll=%f, pitch=%f, yaw=%f, thrust=%f, modeSwitch=%d, manualOverrideSwitch=%d", [super description], [self timeBootMs], [self roll], [self pitch], [self yaw], [self thrust], [self modeSwitch], [self manualOverrideSwitch]];
}

@end
