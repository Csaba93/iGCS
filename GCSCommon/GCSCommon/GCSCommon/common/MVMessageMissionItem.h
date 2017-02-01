//
//  MVMessageMissionItem.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MISSION_ITEM Mavlink message.

 @discussion Message encoding a mission item. This message is emitted to announce
                the presence of a mission item and to set a mission item on the system. The mission item can be either in x, y, z meters (type: LOCAL) or x:lat, y:lon, z:altitude. Local frame is Z-down, right handed (NED), global frame is Z-up, right handed (ENU). See also http://qgroundcontrol.org/mavlink/waypoint_protocol.
 */
@interface MVMessageMissionItem : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent seq:(uint16_t)seq frame:(uint8_t)frame command:(uint16_t)command current:(uint8_t)current autocontinue:(uint8_t)autocontinue param1:(float)param1 param2:(float)param2 param3:(float)param3 param4:(float)param4 x:(float)x y:(float)y z:(float)z;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Sequence
- (uint16_t)seq;

//! The coordinate system of the MISSION. see MAV_FRAME in mavlink_types.h
- (uint8_t)frame;

//! The scheduled action for the MISSION. see MAV_CMD in common.xml MAVLink specs
- (uint16_t)command;

//! false:0, true:1
- (uint8_t)current;

//! autocontinue to next wp
- (uint8_t)autocontinue;

//! PARAM1, see MAV_CMD enum
- (float)param1;

//! PARAM2, see MAV_CMD enum
- (float)param2;

//! PARAM3, see MAV_CMD enum
- (float)param3;

//! PARAM4, see MAV_CMD enum
- (float)param4;

//! PARAM5 / local: x position, global: latitude
- (float)x;

//! PARAM6 / y position: global: longitude
- (float)y;

//! PARAM7 / z position: global: altitude (relative or absolute, depending on frame.
- (float)z;

@end
