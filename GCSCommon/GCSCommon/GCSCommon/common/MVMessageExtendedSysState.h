//
//  MVMessageExtendedSysState.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a EXTENDED_SYS_STATE Mavlink message.

 @discussion Provides state for additional features
 */
@interface MVMessageExtendedSysState : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId vtolState:(MAV_VTOL_STATE)vtolState landedState:(MAV_LANDED_STATE)landedState;

//! The VTOL state if applicable. Is set to MAV_VTOL_STATE_UNDEFINED if UAV is not in VTOL configuration.
- (MAV_VTOL_STATE)vtolState;

//! The landed state. Is set to MAV_LANDED_STATE_UNDEFINED if landed state is unknown.
- (MAV_LANDED_STATE)landedState;

@end
