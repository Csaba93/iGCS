//
//  MVMessageFollowTarget.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageFollowTarget.h"

@implementation MVMessageFollowTarget

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timestamp:(uint64_t)timestamp estCapabilities:(uint8_t)estCapabilities lat:(int32_t)lat lon:(int32_t)lon alt:(float)alt vel:(float *)vel acc:(float *)acc attitudeQ:(float *)attitudeQ rates:(float *)rates positionCov:(float *)positionCov customState:(uint64_t)customState {
  if ((self = [super init])) {
    mavlink_msg_follow_target_pack(systemId, componentId, &(self->_message), timestamp, estCapabilities, lat, lon, alt, vel, acc, attitudeQ, rates, positionCov, customState);
  }
  return self;
}

- (uint64_t)timestamp {
  return mavlink_msg_follow_target_get_timestamp(&(self->_message));
}

- (uint8_t)estCapabilities {
  return mavlink_msg_follow_target_get_est_capabilities(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_follow_target_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_follow_target_get_lon(&(self->_message));
}

- (float)alt {
  return mavlink_msg_follow_target_get_alt(&(self->_message));
}

- (uint16_t)vel:(float *)vel {
  return mavlink_msg_follow_target_get_vel(&(self->_message), vel);
}

- (uint16_t)acc:(float *)acc {
  return mavlink_msg_follow_target_get_acc(&(self->_message), acc);
}

- (uint16_t)attitudeQ:(float *)attitude_q {
  return mavlink_msg_follow_target_get_attitude_q(&(self->_message), attitude_q);
}

- (uint16_t)rates:(float *)rates {
  return mavlink_msg_follow_target_get_rates(&(self->_message), rates);
}

- (uint16_t)positionCov:(float *)position_cov {
  return mavlink_msg_follow_target_get_position_cov(&(self->_message), position_cov);
}

- (uint64_t)customState {
  return mavlink_msg_follow_target_get_custom_state(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timestamp=%lld, estCapabilities=%d, lat=%d, lon=%d, alt=%f, vel=%@, acc=%@, attitudeQ=%@, rates=%@, positionCov=%@, customState=%lld", [super description], [self timestamp], [self estCapabilities], [self lat], [self lon], [self alt], @"[array of float[3]]", @"[array of float[3]]", @"[array of float[4]]", @"[array of float[3]]", @"[array of float[3]]", [self customState]];
}

@end
