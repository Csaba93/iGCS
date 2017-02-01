//
//  MVMessageHilActuatorControls.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIL_ACTUATOR_CONTROLS Mavlink message.

 @discussion Sent from autopilot to simulation. Hardware in the loop control outputs (replacement for HIL_CONTROLS)
 */
@interface MVMessageHilActuatorControls : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec controls:(float *)controls mode:(uint8_t)mode flags:(uint64_t)flags;

//! Timestamp (microseconds since UNIX epoch or microseconds since system boot)
- (uint64_t)timeUsec;

//! Control outputs -1 .. 1. Channel assignment depends on the simulated hardware.
- (uint16_t)controls:(float *)controls;

//! System mode (MAV_MODE), includes arming state.
- (uint8_t)mode;

//! Flags as bitfield, reserved for future use.
- (uint64_t)flags;

@end
