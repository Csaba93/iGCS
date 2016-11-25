//
//  MVMessageControlSystemState.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageControlSystemState.h"

@implementation MVMessageControlSystemState

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec xAcc:(float)xAcc yAcc:(float)yAcc zAcc:(float)zAcc xVel:(float)xVel yVel:(float)yVel zVel:(float)zVel xPos:(float)xPos yPos:(float)yPos zPos:(float)zPos airspeed:(float)airspeed velVariance:(float *)velVariance posVariance:(float *)posVariance q:(float *)q rollRate:(float)rollRate pitchRate:(float)pitchRate yawRate:(float)yawRate {
  if ((self = [super init])) {
    mavlink_msg_control_system_state_pack(systemId, componentId, &(self->_message), timeUsec, xAcc, yAcc, zAcc, xVel, yVel, zVel, xPos, yPos, zPos, airspeed, velVariance, posVariance, q, rollRate, pitchRate, yawRate);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_control_system_state_get_time_usec(&(self->_message));
}

- (float)xAcc {
  return mavlink_msg_control_system_state_get_x_acc(&(self->_message));
}

- (float)yAcc {
  return mavlink_msg_control_system_state_get_y_acc(&(self->_message));
}

- (float)zAcc {
  return mavlink_msg_control_system_state_get_z_acc(&(self->_message));
}

- (float)xVel {
  return mavlink_msg_control_system_state_get_x_vel(&(self->_message));
}

- (float)yVel {
  return mavlink_msg_control_system_state_get_y_vel(&(self->_message));
}

- (float)zVel {
  return mavlink_msg_control_system_state_get_z_vel(&(self->_message));
}

- (float)xPos {
  return mavlink_msg_control_system_state_get_x_pos(&(self->_message));
}

- (float)yPos {
  return mavlink_msg_control_system_state_get_y_pos(&(self->_message));
}

- (float)zPos {
  return mavlink_msg_control_system_state_get_z_pos(&(self->_message));
}

- (float)airspeed {
  return mavlink_msg_control_system_state_get_airspeed(&(self->_message));
}

- (uint16_t)velVariance:(float *)vel_variance {
  return mavlink_msg_control_system_state_get_vel_variance(&(self->_message), vel_variance);
}

- (uint16_t)posVariance:(float *)pos_variance {
  return mavlink_msg_control_system_state_get_pos_variance(&(self->_message), pos_variance);
}

- (uint16_t)q:(float *)q {
  return mavlink_msg_control_system_state_get_q(&(self->_message), q);
}

- (float)rollRate {
  return mavlink_msg_control_system_state_get_roll_rate(&(self->_message));
}

- (float)pitchRate {
  return mavlink_msg_control_system_state_get_pitch_rate(&(self->_message));
}

- (float)yawRate {
  return mavlink_msg_control_system_state_get_yaw_rate(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, xAcc=%f, yAcc=%f, zAcc=%f, xVel=%f, yVel=%f, zVel=%f, xPos=%f, yPos=%f, zPos=%f, airspeed=%f, velVariance=%@, posVariance=%@, q=%@, rollRate=%f, pitchRate=%f, yawRate=%f", [super description], [self timeUsec], [self xAcc], [self yAcc], [self zAcc], [self xVel], [self yVel], [self zVel], [self xPos], [self yPos], [self zPos], [self airspeed], @"[array of float[3]]", @"[array of float[3]]", @"[array of float[4]]", [self rollRate], [self pitchRate], [self yawRate]];
}

@end
