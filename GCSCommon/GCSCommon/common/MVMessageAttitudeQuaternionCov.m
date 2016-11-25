//
//  MVMessageAttitudeQuaternionCov.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAttitudeQuaternionCov.h"

@implementation MVMessageAttitudeQuaternionCov

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec q:(float *)q rollspeed:(float)rollspeed pitchspeed:(float)pitchspeed yawspeed:(float)yawspeed covariance:(float *)covariance {
  if ((self = [super init])) {
    mavlink_msg_attitude_quaternion_cov_pack(systemId, componentId, &(self->_message), timeUsec, q, rollspeed, pitchspeed, yawspeed, covariance);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_attitude_quaternion_cov_get_time_usec(&(self->_message));
}

- (uint16_t)q:(float *)q {
  return mavlink_msg_attitude_quaternion_cov_get_q(&(self->_message), q);
}

- (float)rollspeed {
  return mavlink_msg_attitude_quaternion_cov_get_rollspeed(&(self->_message));
}

- (float)pitchspeed {
  return mavlink_msg_attitude_quaternion_cov_get_pitchspeed(&(self->_message));
}

- (float)yawspeed {
  return mavlink_msg_attitude_quaternion_cov_get_yawspeed(&(self->_message));
}

- (uint16_t)covariance:(float *)covariance {
  return mavlink_msg_attitude_quaternion_cov_get_covariance(&(self->_message), covariance);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, q=%@, rollspeed=%f, pitchspeed=%f, yawspeed=%f, covariance=%@", [super description], [self timeUsec], @"[array of float[4]]", [self rollspeed], [self pitchspeed], [self yawspeed], @"[array of float[9]]"];
}

@end
