//
//  MVMessageEstimatorStatus.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageEstimatorStatus.h"

@implementation MVMessageEstimatorStatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec flags:(ESTIMATOR_STATUS_FLAGS)flags velRatio:(float)velRatio posHorizRatio:(float)posHorizRatio posVertRatio:(float)posVertRatio magRatio:(float)magRatio haglRatio:(float)haglRatio tasRatio:(float)tasRatio posHorizAccuracy:(float)posHorizAccuracy posVertAccuracy:(float)posVertAccuracy {
  if ((self = [super init])) {
    mavlink_msg_estimator_status_pack(systemId, componentId, &(self->_message), timeUsec, flags, velRatio, posHorizRatio, posVertRatio, magRatio, haglRatio, tasRatio, posHorizAccuracy, posVertAccuracy);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_estimator_status_get_time_usec(&(self->_message));
}

- (ESTIMATOR_STATUS_FLAGS)flags {
  return mavlink_msg_estimator_status_get_flags(&(self->_message));
}

- (float)velRatio {
  return mavlink_msg_estimator_status_get_vel_ratio(&(self->_message));
}

- (float)posHorizRatio {
  return mavlink_msg_estimator_status_get_pos_horiz_ratio(&(self->_message));
}

- (float)posVertRatio {
  return mavlink_msg_estimator_status_get_pos_vert_ratio(&(self->_message));
}

- (float)magRatio {
  return mavlink_msg_estimator_status_get_mag_ratio(&(self->_message));
}

- (float)haglRatio {
  return mavlink_msg_estimator_status_get_hagl_ratio(&(self->_message));
}

- (float)tasRatio {
  return mavlink_msg_estimator_status_get_tas_ratio(&(self->_message));
}

- (float)posHorizAccuracy {
  return mavlink_msg_estimator_status_get_pos_horiz_accuracy(&(self->_message));
}

- (float)posVertAccuracy {
  return mavlink_msg_estimator_status_get_pos_vert_accuracy(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, flags=%d, velRatio=%f, posHorizRatio=%f, posVertRatio=%f, magRatio=%f, haglRatio=%f, tasRatio=%f, posHorizAccuracy=%f, posVertAccuracy=%f", [super description], [self timeUsec], [self flags], [self velRatio], [self posHorizRatio], [self posVertRatio], [self magRatio], [self haglRatio], [self tasRatio], [self posHorizAccuracy], [self posVertAccuracy]];
}

@end
