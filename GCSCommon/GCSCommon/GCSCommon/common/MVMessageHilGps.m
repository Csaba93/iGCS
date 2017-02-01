//
//  MVMessageHilGps.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHilGps.h"

@implementation MVMessageHilGps

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec fixType:(uint8_t)fixType lat:(int32_t)lat lon:(int32_t)lon alt:(int32_t)alt eph:(uint16_t)eph epv:(uint16_t)epv vel:(uint16_t)vel vn:(int16_t)vn ve:(int16_t)ve vd:(int16_t)vd cog:(uint16_t)cog satellitesVisible:(uint8_t)satellitesVisible {
  if ((self = [super init])) {
    mavlink_msg_hil_gps_pack(systemId, componentId, &(self->_message), timeUsec, fixType, lat, lon, alt, eph, epv, vel, vn, ve, vd, cog, satellitesVisible);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_hil_gps_get_time_usec(&(self->_message));
}

- (uint8_t)fixType {
  return mavlink_msg_hil_gps_get_fix_type(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_hil_gps_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_hil_gps_get_lon(&(self->_message));
}

- (int32_t)alt {
  return mavlink_msg_hil_gps_get_alt(&(self->_message));
}

- (uint16_t)eph {
  return mavlink_msg_hil_gps_get_eph(&(self->_message));
}

- (uint16_t)epv {
  return mavlink_msg_hil_gps_get_epv(&(self->_message));
}

- (uint16_t)vel {
  return mavlink_msg_hil_gps_get_vel(&(self->_message));
}

- (int16_t)vn {
  return mavlink_msg_hil_gps_get_vn(&(self->_message));
}

- (int16_t)ve {
  return mavlink_msg_hil_gps_get_ve(&(self->_message));
}

- (int16_t)vd {
  return mavlink_msg_hil_gps_get_vd(&(self->_message));
}

- (uint16_t)cog {
  return mavlink_msg_hil_gps_get_cog(&(self->_message));
}

- (uint8_t)satellitesVisible {
  return mavlink_msg_hil_gps_get_satellites_visible(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, fixType=%d, lat=%d, lon=%d, alt=%d, eph=%d, epv=%d, vel=%d, vn=%d, ve=%d, vd=%d, cog=%d, satellitesVisible=%d", [super description], [self timeUsec], [self fixType], [self lat], [self lon], [self alt], [self eph], [self epv], [self vel], [self vn], [self ve], [self vd], [self cog], [self satellitesVisible]];
}

@end
