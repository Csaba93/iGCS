//
//  MVMessageHilStateQuaternion.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHilStateQuaternion.h"

@implementation MVMessageHilStateQuaternion

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec attitudeQuaternion:(float *)attitudeQuaternion rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt vx:(int16_t)vx vy:(int16_t)vy vz:(int16_t)vz indAirspeed:(uint16_t)indAirspeed trueAirspeed:(uint16_t)trueAirspeed xacc:(int16_t)xacc yacc:(int16_t)yacc zacc:(int16_t)zacc {
  if ((self = [super init])) {
    mavlink_msg_hil_state_quaternion_pack(systemId, componentId, &(self->_message), timeUsec, attitudeQuaternion, rollspeed, pitchspeed, yawspeed, lat, lon, alt, vx, vy, vz, indAirspeed, trueAirspeed, xacc, yacc, zacc);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_hil_state_quaternion_get_time_usec(&(self->_message));
}

- (uint16_t)attitudeQuaternion:(float *)attitude_quaternion {
  return mavlink_msg_hil_state_quaternion_get_attitude_quaternion(&(self->_message), attitude_quaternion);
}

- (float)rollspeed {
  return mavlink_msg_hil_state_quaternion_get_rollspeed(&(self->_message));
}

- (float)pitchspeed {
  return mavlink_msg_hil_state_quaternion_get_pitchspeed(&(self->_message));
}

- (float)yawspeed {
  return mavlink_msg_hil_state_quaternion_get_yawspeed(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_hil_state_quaternion_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_hil_state_quaternion_get_lon(&(self->_message));
}

- (int32_t)alt {
  return mavlink_msg_hil_state_quaternion_get_alt(&(self->_message));
}

- (int16_t)vx {
  return mavlink_msg_hil_state_quaternion_get_vx(&(self->_message));
}

- (int16_t)vy {
  return mavlink_msg_hil_state_quaternion_get_vy(&(self->_message));
}

- (int16_t)vz {
  return mavlink_msg_hil_state_quaternion_get_vz(&(self->_message));
}

- (uint16_t)indAirspeed {
  return mavlink_msg_hil_state_quaternion_get_ind_airspeed(&(self->_message));
}

- (uint16_t)trueAirspeed {
  return mavlink_msg_hil_state_quaternion_get_true_airspeed(&(self->_message));
}

- (int16_t)xacc {
  return mavlink_msg_hil_state_quaternion_get_xacc(&(self->_message));
}

- (int16_t)yacc {
  return mavlink_msg_hil_state_quaternion_get_yacc(&(self->_message));
}

- (int16_t)zacc {
  return mavlink_msg_hil_state_quaternion_get_zacc(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, attitudeQuaternion=%@, rollspeed=%f, pitchspeed=%f, yawspeed=%f, lat=%d, lon=%d, alt=%d, vx=%d, vy=%d, vz=%d, indAirspeed=%d, trueAirspeed=%d, xacc=%d, yacc=%d, zacc=%d", [super description], [self timeUsec], @"[array of float[4]]", [self rollspeed], [self pitchspeed], [self yawspeed], [self lat], [self lon], [self alt], [self vx], [self vy], [self vz], [self indAirspeed], [self trueAirspeed], [self xacc], [self yacc], [self zacc]];
}

@end
