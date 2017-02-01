//
//  MVMessageSetActuatorControlTarget.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetActuatorControlTarget.h"

@implementation MVMessageSetActuatorControlTarget

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec groupMlx:(uint8_t)groupMlx targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent controls:(float *)controls {
  if ((self = [super init])) {
    mavlink_msg_set_actuator_control_target_pack(systemId, componentId, &(self->_message), timeUsec, groupMlx, targetSystem, targetComponent, controls);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_set_actuator_control_target_get_time_usec(&(self->_message));
}

- (uint8_t)groupMlx {
  return mavlink_msg_set_actuator_control_target_get_group_mlx(&(self->_message));
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_actuator_control_target_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_set_actuator_control_target_get_target_component(&(self->_message));
}

- (uint16_t)controls:(float *)controls {
  return mavlink_msg_set_actuator_control_target_get_controls(&(self->_message), controls);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, groupMlx=%d, targetSystem=%d, targetComponent=%d, controls=%@", [super description], [self timeUsec], [self groupMlx], [self targetSystem], [self targetComponent], @"[array of float[8]]"];
}

@end
