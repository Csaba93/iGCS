//
//  MVMessageGlobalPositionIntCov.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGlobalPositionIntCov.h"

@implementation MVMessageGlobalPositionIntCov

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec estimatorType:(MAV_ESTIMATOR_TYPE)estimatorType lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt relativeAlt:(int32_t)relativeAlt vx:(float)vx vy:(float)vy vz:(float)vz covariance:(float *)covariance {
  if ((self = [super init])) {
    mavlink_msg_global_position_int_cov_pack(systemId, componentId, &(self->_message), timeUsec, estimatorType, lat, lon, alt, relativeAlt, vx, vy, vz, covariance);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_global_position_int_cov_get_time_usec(&(self->_message));
}

- (MAV_ESTIMATOR_TYPE)estimatorType {
  return mavlink_msg_global_position_int_cov_get_estimator_type(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_global_position_int_cov_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_global_position_int_cov_get_lon(&(self->_message));
}

- (int32_t)alt {
  return mavlink_msg_global_position_int_cov_get_alt(&(self->_message));
}

- (int32_t)relativeAlt {
  return mavlink_msg_global_position_int_cov_get_relative_alt(&(self->_message));
}

- (float)vx {
  return mavlink_msg_global_position_int_cov_get_vx(&(self->_message));
}

- (float)vy {
  return mavlink_msg_global_position_int_cov_get_vy(&(self->_message));
}

- (float)vz {
  return mavlink_msg_global_position_int_cov_get_vz(&(self->_message));
}

- (uint16_t)covariance:(float *)covariance {
  return mavlink_msg_global_position_int_cov_get_covariance(&(self->_message), covariance);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, estimatorType=%d, lat=%d, lon=%d, alt=%d, relativeAlt=%d, vx=%f, vy=%f, vz=%f, covariance=%@", [super description], [self timeUsec], [self estimatorType], [self lat], [self lon], [self alt], [self relativeAlt], [self vx], [self vy], [self vz], @"[array of float[36]]"];
}

@end
