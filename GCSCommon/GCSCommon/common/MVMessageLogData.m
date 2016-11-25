//
//  MVMessageLogData.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageLogData.h"

@implementation MVMessageLogData

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId id:(uint16_t)id ofs:(uint32_t)ofs count:(uint8_t)count data:(uint8_t *)data {
  if ((self = [super init])) {
    mavlink_msg_log_data_pack(systemId, componentId, &(self->_message), id, ofs, count, data);
  }
  return self;
}

- (uint16_t)id {
  return mavlink_msg_log_data_get_id(&(self->_message));
}

- (uint32_t)ofs {
  return mavlink_msg_log_data_get_ofs(&(self->_message));
}

- (uint8_t)count {
  return mavlink_msg_log_data_get_count(&(self->_message));
}

- (uint16_t)data:(uint8_t *)data {
  return mavlink_msg_log_data_get_data(&(self->_message), data);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, id=%d, ofs=%d, count=%d, data=%@", [super description], [self id], [self ofs], [self count], @"[array of uint8_t[90]]"];
}

@end
