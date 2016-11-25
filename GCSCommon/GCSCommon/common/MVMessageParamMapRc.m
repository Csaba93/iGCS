//
//  MVMessageParamMapRc.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageParamMapRc.h"

@implementation MVMessageParamMapRc

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent paramId:(char *)paramId paramIndex:(int16_t)paramIndex parameterRcChannelIndex:(uint8_t)parameterRcChannelIndex paramValue0:(float)paramValue0 scale:(float)scale paramValueMin:(float)paramValueMin paramValueMax:(float)paramValueMax {
  if ((self = [super init])) {
    mavlink_msg_param_map_rc_pack(systemId, componentId, &(self->_message), targetSystem, targetComponent, paramId, paramIndex, parameterRcChannelIndex, paramValue0, scale, paramValueMin, paramValueMax);
  }
  return self;
}

- (uint8_t)targetSystem {
  return mavlink_msg_param_map_rc_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_param_map_rc_get_target_component(&(self->_message));
}

- (NSString *)paramId {
  char string[16];
  mavlink_msg_param_map_rc_get_param_id(&(self->_message), (char *)&string);
  return [[NSString alloc] initWithBytes:string length:16 encoding:NSASCIIStringEncoding];
}

- (int16_t)paramIndex {
  return mavlink_msg_param_map_rc_get_param_index(&(self->_message));
}

- (uint8_t)parameterRcChannelIndex {
  return mavlink_msg_param_map_rc_get_parameter_rc_channel_index(&(self->_message));
}

- (float)paramValue0 {
  return mavlink_msg_param_map_rc_get_param_value0(&(self->_message));
}

- (float)scale {
  return mavlink_msg_param_map_rc_get_scale(&(self->_message));
}

- (float)paramValueMin {
  return mavlink_msg_param_map_rc_get_param_value_min(&(self->_message));
}

- (float)paramValueMax {
  return mavlink_msg_param_map_rc_get_param_value_max(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, targetSystem=%d, targetComponent=%d, paramId=%@, paramIndex=%d, parameterRcChannelIndex=%d, paramValue0=%f, scale=%f, paramValueMin=%f, paramValueMax=%f", [super description], [self targetSystem], [self targetComponent], [self paramId], [self paramIndex], [self parameterRcChannelIndex], [self paramValue0], [self scale], [self paramValueMin], [self paramValueMax]];
}

@end
