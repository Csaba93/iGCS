//
//  MVMessageSetAttitudeTarget.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetAttitudeTarget.h"

@implementation MVMessageSetAttitudeTarget

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent typeMask:(uint8_t)typeMask q:(float *)q bodyRollRate:(float)bodyRollRate bodyPitchRate:(float)bodyPitchRate bodyYawRate:(float)bodyYawRate thrust:(float)thrust {
  if ((self = [super init])) {
    mavlink_msg_set_attitude_target_pack(systemId, componentId, &(self->_message), timeBootMs, targetSystem, targetComponent, typeMask, q, bodyRollRate, bodyPitchRate, bodyYawRate, thrust);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_set_attitude_target_get_time_boot_ms(&(self->_message));
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_attitude_target_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_set_attitude_target_get_target_component(&(self->_message));
}

- (uint8_t)typeMask {
  return mavlink_msg_set_attitude_target_get_type_mask(&(self->_message));
}

- (uint16_t)q:(float *)q {
  return mavlink_msg_set_attitude_target_get_q(&(self->_message), q);
}

- (float)bodyRollRate {
  return mavlink_msg_set_attitude_target_get_body_roll_rate(&(self->_message));
}

- (float)bodyPitchRate {
  return mavlink_msg_set_attitude_target_get_body_pitch_rate(&(self->_message));
}

- (float)bodyYawRate {
  return mavlink_msg_set_attitude_target_get_body_yaw_rate(&(self->_message));
}

- (float)thrust {
  return mavlink_msg_set_attitude_target_get_thrust(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, targetSystem=%d, targetComponent=%d, typeMask=%d, q=%@, bodyRollRate=%f, bodyPitchRate=%f, bodyYawRate=%f, thrust=%f", [super description], [self timeBootMs], [self targetSystem], [self targetComponent], [self typeMask], @"[array of float[4]]", [self bodyRollRate], [self bodyPitchRate], [self bodyYawRate], [self thrust]];
}

@end
