//
//  MVMessageSimState.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSimState.h"

@implementation MVMessageSimState

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId q1:(float)q1 q2:(float)q2 q3:(float)q3 q4:(float)q4 roll:(float)roll pitch:(float)pitch yaw:(float)yaw xacc:(float)xacc yacc:(float)yacc zacc:(float)zacc xgyro:(float)xgyro ygyro:(float)ygyro zgyro:(float)zgyro lat:(float)lat lon:(float)lon alt:(float)alt stdDevHorz:(float)stdDevHorz stdDevVert:(float)stdDevVert vn:(float)vn ve:(float)ve vd:(float)vd {
  if ((self = [super init])) {
    mavlink_msg_sim_state_pack(systemId, componentId, &(self->_message), q1, q2, q3, q4, roll, pitch, yaw, xacc, yacc, zacc, xgyro, ygyro, zgyro, lat, lon, alt, stdDevHorz, stdDevVert, vn, ve, vd);
  }
  return self;
}

- (float)q1 {
  return mavlink_msg_sim_state_get_q1(&(self->_message));
}

- (float)q2 {
  return mavlink_msg_sim_state_get_q2(&(self->_message));
}

- (float)q3 {
  return mavlink_msg_sim_state_get_q3(&(self->_message));
}

- (float)q4 {
  return mavlink_msg_sim_state_get_q4(&(self->_message));
}

- (float)roll {
  return mavlink_msg_sim_state_get_roll(&(self->_message));
}

- (float)pitch {
  return mavlink_msg_sim_state_get_pitch(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_sim_state_get_yaw(&(self->_message));
}

- (float)xacc {
  return mavlink_msg_sim_state_get_xacc(&(self->_message));
}

- (float)yacc {
  return mavlink_msg_sim_state_get_yacc(&(self->_message));
}

- (float)zacc {
  return mavlink_msg_sim_state_get_zacc(&(self->_message));
}

- (float)xgyro {
  return mavlink_msg_sim_state_get_xgyro(&(self->_message));
}

- (float)ygyro {
  return mavlink_msg_sim_state_get_ygyro(&(self->_message));
}

- (float)zgyro {
  return mavlink_msg_sim_state_get_zgyro(&(self->_message));
}

- (float)lat {
  return mavlink_msg_sim_state_get_lat(&(self->_message));
}

- (float)lon {
  return mavlink_msg_sim_state_get_lon(&(self->_message));
}

- (float)alt {
  return mavlink_msg_sim_state_get_alt(&(self->_message));
}

- (float)stdDevHorz {
  return mavlink_msg_sim_state_get_std_dev_horz(&(self->_message));
}

- (float)stdDevVert {
  return mavlink_msg_sim_state_get_std_dev_vert(&(self->_message));
}

- (float)vn {
  return mavlink_msg_sim_state_get_vn(&(self->_message));
}

- (float)ve {
  return mavlink_msg_sim_state_get_ve(&(self->_message));
}

- (float)vd {
  return mavlink_msg_sim_state_get_vd(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, q1=%f, q2=%f, q3=%f, q4=%f, roll=%f, pitch=%f, yaw=%f, xacc=%f, yacc=%f, zacc=%f, xgyro=%f, ygyro=%f, zgyro=%f, lat=%f, lon=%f, alt=%f, stdDevHorz=%f, stdDevVert=%f, vn=%f, ve=%f, vd=%f", [super description], [self q1], [self q2], [self q3], [self q4], [self roll], [self pitch], [self yaw], [self xacc], [self yacc], [self zacc], [self xgyro], [self ygyro], [self zgyro], [self lat], [self lon], [self alt], [self stdDevHorz], [self stdDevVert], [self vn], [self ve], [self vd]];
}

@end
