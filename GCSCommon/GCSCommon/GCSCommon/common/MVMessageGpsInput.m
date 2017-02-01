//
//  MVMessageGpsInput.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGpsInput.h"

@implementation MVMessageGpsInput

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec gpsId:(uint8_t)gpsId ignoreFlags:(GPS_INPUT_IGNORE_FLAGS)ignoreFlags timeWeekMs:(uint32_t)timeWeekMs timeWeek:(uint16_t)timeWeek fixType:(uint8_t)fixType lat:(int32_t)lat lon:(int32_t)lon alt:(float)alt hdop:(float)hdop vdop:(float)vdop vn:(float)vn ve:(float)ve vd:(float)vd speedAccuracy:(float)speedAccuracy horizAccuracy:(float)horizAccuracy vertAccuracy:(float)vertAccuracy satellitesVisible:(uint8_t)satellitesVisible {
  if ((self = [super init])) {
    mavlink_msg_gps_input_pack(systemId, componentId, &(self->_message), timeUsec, gpsId, ignoreFlags, timeWeekMs, timeWeek, fixType, lat, lon, alt, hdop, vdop, vn, ve, vd, speedAccuracy, horizAccuracy, vertAccuracy, satellitesVisible);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_gps_input_get_time_usec(&(self->_message));
}

- (uint8_t)gpsId {
  return mavlink_msg_gps_input_get_gps_id(&(self->_message));
}

- (GPS_INPUT_IGNORE_FLAGS)ignoreFlags {
  return mavlink_msg_gps_input_get_ignore_flags(&(self->_message));
}

- (uint32_t)timeWeekMs {
  return mavlink_msg_gps_input_get_time_week_ms(&(self->_message));
}

- (uint16_t)timeWeek {
  return mavlink_msg_gps_input_get_time_week(&(self->_message));
}

- (uint8_t)fixType {
  return mavlink_msg_gps_input_get_fix_type(&(self->_message));
}

- (int32_t)lat {
  return mavlink_msg_gps_input_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_gps_input_get_lon(&(self->_message));
}

- (float)alt {
  return mavlink_msg_gps_input_get_alt(&(self->_message));
}

- (float)hdop {
  return mavlink_msg_gps_input_get_hdop(&(self->_message));
}

- (float)vdop {
  return mavlink_msg_gps_input_get_vdop(&(self->_message));
}

- (float)vn {
  return mavlink_msg_gps_input_get_vn(&(self->_message));
}

- (float)ve {
  return mavlink_msg_gps_input_get_ve(&(self->_message));
}

- (float)vd {
  return mavlink_msg_gps_input_get_vd(&(self->_message));
}

- (float)speedAccuracy {
  return mavlink_msg_gps_input_get_speed_accuracy(&(self->_message));
}

- (float)horizAccuracy {
  return mavlink_msg_gps_input_get_horiz_accuracy(&(self->_message));
}

- (float)vertAccuracy {
  return mavlink_msg_gps_input_get_vert_accuracy(&(self->_message));
}

- (uint8_t)satellitesVisible {
  return mavlink_msg_gps_input_get_satellites_visible(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, gpsId=%d, ignoreFlags=%d, timeWeekMs=%d, timeWeek=%d, fixType=%d, lat=%d, lon=%d, alt=%f, hdop=%f, vdop=%f, vn=%f, ve=%f, vd=%f, speedAccuracy=%f, horizAccuracy=%f, vertAccuracy=%f, satellitesVisible=%d", [super description], [self timeUsec], [self gpsId], [self ignoreFlags], [self timeWeekMs], [self timeWeek], [self fixType], [self lat], [self lon], [self alt], [self hdop], [self vdop], [self vn], [self ve], [self vd], [self speedAccuracy], [self horizAccuracy], [self vertAccuracy], [self satellitesVisible]];
}

@end
