//
//  MVMessageWindCov.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageWindCov.h"

@implementation MVMessageWindCov

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec windX:(float)windX windY:(float)windY windZ:(float)windZ varHoriz:(float)varHoriz varVert:(float)varVert windAlt:(float)windAlt horizAccuracy:(float)horizAccuracy vertAccuracy:(float)vertAccuracy {
  if ((self = [super init])) {
    mavlink_msg_wind_cov_pack(systemId, componentId, &(self->_message), timeUsec, windX, windY, windZ, varHoriz, varVert, windAlt, horizAccuracy, vertAccuracy);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_wind_cov_get_time_usec(&(self->_message));
}

- (float)windX {
  return mavlink_msg_wind_cov_get_wind_x(&(self->_message));
}

- (float)windY {
  return mavlink_msg_wind_cov_get_wind_y(&(self->_message));
}

- (float)windZ {
  return mavlink_msg_wind_cov_get_wind_z(&(self->_message));
}

- (float)varHoriz {
  return mavlink_msg_wind_cov_get_var_horiz(&(self->_message));
}

- (float)varVert {
  return mavlink_msg_wind_cov_get_var_vert(&(self->_message));
}

- (float)windAlt {
  return mavlink_msg_wind_cov_get_wind_alt(&(self->_message));
}

- (float)horizAccuracy {
  return mavlink_msg_wind_cov_get_horiz_accuracy(&(self->_message));
}

- (float)vertAccuracy {
  return mavlink_msg_wind_cov_get_vert_accuracy(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, windX=%f, windY=%f, windZ=%f, varHoriz=%f, varVert=%f, windAlt=%f, horizAccuracy=%f, vertAccuracy=%f", [super description], [self timeUsec], [self windX], [self windY], [self windZ], [self varHoriz], [self varVert], [self windAlt], [self horizAccuracy], [self vertAccuracy]];
}

@end
