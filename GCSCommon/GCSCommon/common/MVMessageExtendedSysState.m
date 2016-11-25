//
//  MVMessageExtendedSysState.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageExtendedSysState.h"

@implementation MVMessageExtendedSysState

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId vtolState:(MAV_VTOL_STATE)vtolState landedState:(MAV_LANDED_STATE)landedState {
  if ((self = [super init])) {
    mavlink_msg_extended_sys_state_pack(systemId, componentId, &(self->_message), vtolState, landedState);
  }
  return self;
}

- (MAV_VTOL_STATE)vtolState {
  return mavlink_msg_extended_sys_state_get_vtol_state(&(self->_message));
}

- (MAV_LANDED_STATE)landedState {
  return mavlink_msg_extended_sys_state_get_landed_state(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, vtolState=%d, landedState=%d", [super description], [self vtolState], [self landedState]];
}

@end
