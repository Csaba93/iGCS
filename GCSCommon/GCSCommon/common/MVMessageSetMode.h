//
//  MVMessageSetMode.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_MODE Mavlink message.

 @discussion THIS INTERFACE IS DEPRECATED. USE COMMAND_LONG with MAV_CMD_DO_SET_MODE INSTEAD. Set the system mode, as defined by enum MAV_MODE. There is no target component id as the mode is by definition for the overall aircraft, not only for one component.
 */
@interface MVMessageSetMode : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem baseMode:(MAV_MODE)baseMode customMode:(uint32_t)customMode;

//! The system setting the mode
- (uint8_t)targetSystem;

//! The new base mode
- (MAV_MODE)baseMode;

//! The new autopilot-specific mode. This field can be ignored by an autopilot.
- (uint32_t)customMode;

@end
