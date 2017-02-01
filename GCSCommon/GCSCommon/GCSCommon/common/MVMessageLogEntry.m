//
//  MVMessageLogEntry.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogEntry.h"

@implementation MVMessageLogEntry

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId id:(uint16_t)id numLogs:(uint16_t)numLogs lastLogNum:(uint16_t)lastLogNum timeUtc:(uint32_t)timeUtc size:(uint32_t)size {
  if ((self = [super init])) {
    mavlink_msg_log_entry_pack(systemId, componentId, &(self->_message), id, numLogs, lastLogNum, timeUtc, size);
  }
  return self;
}

- (uint16_t)id {
  return mavlink_msg_log_entry_get_id(&(self->_message));
}

- (uint16_t)numLogs {
  return mavlink_msg_log_entry_get_num_logs(&(self->_message));
}

- (uint16_t)lastLogNum {
  return mavlink_msg_log_entry_get_last_log_num(&(self->_message));
}

- (uint32_t)timeUtc {
  return mavlink_msg_log_entry_get_time_utc(&(self->_message));
}

- (uint32_t)size {
  return mavlink_msg_log_entry_get_size(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, id=%d, numLogs=%d, lastLogNum=%d, timeUtc=%d, size=%d", [super description], [self id], [self numLogs], [self lastLogNum], [self timeUtc], [self size]];
}

@end
