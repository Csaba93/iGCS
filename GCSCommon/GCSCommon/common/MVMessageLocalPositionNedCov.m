//
//  MVMessageLocalPositionNedCov.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLocalPositionNedCov.h"

@implementation MVMessageLocalPositionNedCov

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec estimatorType:(MAV_ESTIMATOR_TYPE)estimatorType x:(float)x y:(float)y z:(float)z vx:(float)vx vy:(float)vy vz:(float)vz ax:(float)ax ay:(float)ay az:(float)az covariance:(float *)covariance {
  if ((self = [super init])) {
    mavlink_msg_local_position_ned_cov_pack(systemId, componentId, &(self->_message), timeUsec, estimatorType, x, y, z, vx, vy, vz, ax, ay, az, covariance);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_local_position_ned_cov_get_time_usec(&(self->_message));
}

- (MAV_ESTIMATOR_TYPE)estimatorType {
  return mavlink_msg_local_position_ned_cov_get_estimator_type(&(self->_message));
}

- (float)x {
  return mavlink_msg_local_position_ned_cov_get_x(&(self->_message));
}

- (float)y {
  return mavlink_msg_local_position_ned_cov_get_y(&(self->_message));
}

- (float)z {
  return mavlink_msg_local_position_ned_cov_get_z(&(self->_message));
}

- (float)vx {
  return mavlink_msg_local_position_ned_cov_get_vx(&(self->_message));
}

- (float)vy {
  return mavlink_msg_local_position_ned_cov_get_vy(&(self->_message));
}

- (float)vz {
  return mavlink_msg_local_position_ned_cov_get_vz(&(self->_message));
}

- (float)ax {
  return mavlink_msg_local_position_ned_cov_get_ax(&(self->_message));
}

- (float)ay {
  return mavlink_msg_local_position_ned_cov_get_ay(&(self->_message));
}

- (float)az {
  return mavlink_msg_local_position_ned_cov_get_az(&(self->_message));
}

- (uint16_t)covariance:(float *)covariance {
  return mavlink_msg_local_position_ned_cov_get_covariance(&(self->_message), covariance);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, estimatorType=%d, x=%f, y=%f, z=%f, vx=%f, vy=%f, vz=%f, ax=%f, ay=%f, az=%f, covariance=%@", [super description], [self timeUsec], [self estimatorType], [self x], [self y], [self z], [self vx], [self vy], [self vz], [self ax], [self ay], [self az], @"[array of float[45]]"];
}

@end
