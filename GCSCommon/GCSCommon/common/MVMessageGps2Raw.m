//
//  MVMessageGps2Raw.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGps2Raw.h"

@implementation MVMessageGps2Raw

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec fixType:(GPS_FIX_TYPE)fixType lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt eph:(uint16_t)eph epv:(uint16_t)epv vel:(uint16_t)vel cog:(uint16_t)cog satellitesVisible:(uint8_t)satellitesVisible dgpsNumch:(uint8_t)dgpsNumch dgpsAge:(uint32_t)dgpsAge {
  if ((self = [super init])) {
    mavlink_msg_gps2_raw_pack(systemId, componentId, &(self->_message), timeUsec, fixType, lat, lon, alt, eph, epv, vel, cog, satellitesVisible, dgpsNumch, dgpsAge);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_gps2_raw_get_time_usec(&(self->_message));
}

- (GPS_FIX_TYPE)fixType {
  return mavlink_msg_gps2_raw_get_fix_type(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_gps2_raw_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_gps2_raw_get_lon(&(self->_message));
}

- (int32_t)alt {
  return mavlink_msg_gps2_raw_get_alt(&(self->_message));
}

- (uint16_t)eph {
  return mavlink_msg_gps2_raw_get_eph(&(self->_message));
}

- (uint16_t)epv {
  return mavlink_msg_gps2_raw_get_epv(&(self->_message));
}

- (uint16_t)vel {
  return mavlink_msg_gps2_raw_get_vel(&(self->_message));
}

- (uint16_t)cog {
  return mavlink_msg_gps2_raw_get_cog(&(self->_message));
}

- (uint8_t)satellitesVisible {
  return mavlink_msg_gps2_raw_get_satellites_visible(&(self->_message));
}

- (uint8_t)dgpsNumch {
  return mavlink_msg_gps2_raw_get_dgps_numch(&(self->_message));
}

- (uint32_t)dgpsAge {
  return mavlink_msg_gps2_raw_get_dgps_age(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, fixType=%d, lat=%d, lon=%d, alt=%d, eph=%d, epv=%d, vel=%d, cog=%d, satellitesVisible=%d, dgpsNumch=%d, dgpsAge=%d", [super description], [self timeUsec], [self fixType], [self lat], [self lon], [self alt], [self eph], [self epv], [self vel], [self cog], [self satellitesVisible], [self dgpsNumch], [self dgpsAge]];
}

@end
