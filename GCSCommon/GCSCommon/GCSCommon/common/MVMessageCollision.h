//
//  MVMessageCollision.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a COLLISION Mavlink message.

 @discussion Information about a potential collision
 */
@interface MVMessageCollision : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId src:(MAV_COLLISION_SRC)src id:(uint32_t)id action:(MAV_COLLISION_ACTION)action threatLevel:(MAV_COLLISION_THREAT_LEVEL)threatLevel timeToMinimumDelta:(float)timeToMinimumDelta altitudeMinimumDelta:(float)altitudeMinimumDelta horizontalMinimumDelta:(float)horizontalMinimumDelta;

//! Collision data source
- (MAV_COLLISION_SRC)src;

//! Unique identifier, domain based on src field
- (uint32_t)id;

//! Action that is being taken to avoid this collision
- (MAV_COLLISION_ACTION)action;

//! How concerned the aircraft is about this collision
- (MAV_COLLISION_THREAT_LEVEL)threatLevel;

//! Estimated time until collision occurs (seconds)
- (float)timeToMinimumDelta;

//! Closest vertical distance in meters between vehicle and object
- (float)altitudeMinimumDelta;

//! Closest horizontal distance in meteres between vehicle and object
- (float)horizontalMinimumDelta;

@end
