//
//  MVMessageActuatorControlTarget.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageActuatorControlTarget.h"

@implementation MVMessageActuatorControlTarget

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec groupMlx:(uint8_t)groupMlx controls:(float *)controls {
  if ((self = [super init])) {
    mavlink_msg_actuator_control_target_pack(systemId, componentId, &(self->_message), timeUsec, groupMlx, controls);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_actuator_control_target_get_time_usec(&(self->_message));
}

- (uint8_t)groupMlx {
  return mavlink_msg_actuator_control_target_get_group_mlx(&(self->_message));
}

- (uint16_t)controls:(float *)controls {
  return mavlink_msg_actuator_control_target_get_controls(&(self->_message), controls);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, groupMlx=%d, controls=%@", [super description], [self timeUsec], [self groupMlx], @"[array of float[8]]"];
}

@end
