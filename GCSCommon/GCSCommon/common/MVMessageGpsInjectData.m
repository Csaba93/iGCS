//
//  MVMessageGpsInjectData.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGpsInjectData.h"

@implementation MVMessageGpsInjectData

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent len:(uint8_t)len data:(uint8_t *)data {
  if ((self = [super init])) {
    mavlink_msg_gps_inject_data_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, len, data);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_gps_inject_data_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_gps_inject_data_get_target_component(&(self->_message));
}

- (uint8_t)len {
  return mavlink_msg_gps_inject_data_get_len(&(self->_message));
}

- (uint16_t)data:(uint8_t *)data {
  return mavlink_msg_gps_inject_data_get_data(&(self->_message), data);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, len=%d, data=%@", [super description], [self targetSystem], [self targetComponent], [self len], @"[array of uint8_t[110]]"];
}

@end
