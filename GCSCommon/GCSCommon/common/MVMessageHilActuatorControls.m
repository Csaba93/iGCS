//
//  MVMessageHilActuatorControls.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHilActuatorControls.h"

@implementation MVMessageHilActuatorControls

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec controls:(float *)controls mode:(uint8_t)mode flags:(uint64_t)flags {
  if ((self = [super init])) {
    mavlink_msg_hil_actuator_controls_pack(systemId, componentId, &(self->_message), timeUsec, controls, mode, flags);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_hil_actuator_controls_get_time_usec(&(self->_message));
}

- (uint16_t)controls:(float *)controls {
  return mavlink_msg_hil_actuator_controls_get_controls(&(self->_message), controls);
}

- (uint8_t)mode {
  return mavlink_msg_hil_actuator_controls_get_mode(&(self->_message));
}

- (uint64_t)flags {
  return mavlink_msg_hil_actuator_controls_get_flags(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, controls=%@, mode=%d, flags=%lld", [super description], [self timeUsec], @"[array of float[16]]", [self mode], [self flags]];
}

@end
