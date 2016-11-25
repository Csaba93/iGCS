//
//  MVMessageGpsRtcmData.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGpsRtcmData.h"

@implementation MVMessageGpsRtcmData

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId flags:(uint8_t)flags len:(uint8_t)len data:(uint8_t *)data {
  if ((self = [super init])) {
    mavlink_msg_gps_rtcm_data_pack(systemId, componentId, &(self->_message), flags, len, data);
  }
  return self;
}

- (uint8_t)flags {
  return mavlink_msg_gps_rtcm_data_get_flags(&(self->_message));
}

- (uint8_t)len {
  return mavlink_msg_gps_rtcm_data_get_len(&(self->_message));
}

- (uint16_t)data:(uint8_t *)data {
  return mavlink_msg_gps_rtcm_data_get_data(&(self->_message), data);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, flags=%d, len=%d, data=%@", [super description], [self flags], [self len], @"[array of uint8_t[180]]"];
}

@end
