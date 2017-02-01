//
//  MVMessageTimesync.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageTimesync.h"

@implementation MVMessageTimesync

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId tc1:(int64_t)tc1 ts1:(int64_t)ts1 {
  if ((self = [super init])) {
    mavlink_msg_timesync_pack(systemId, componentId, &(self->_message), tc1, ts1);
  }
  return self;
}

- (int64_t)tc1 {
  return mavlink_msg_timesync_get_tc1(&(self->_message));
}

- (int64_t)ts1 {
  return mavlink_msg_timesync_get_ts1(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, tc1=%d, ts1=%d", [super description], [self tc1], [self ts1]];
}

@end
