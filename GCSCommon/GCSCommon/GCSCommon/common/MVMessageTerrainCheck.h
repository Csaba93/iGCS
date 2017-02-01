//
//  MVMessageTerrainCheck.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a TERRAIN_CHECK Mavlink message.

 @discussion Request that the vehicle report terrain height at the given location. Used by GCS to check if vehicle has all terrain data needed for a mission.
 */
@interface MVMessageTerrainCheck : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId lat:(int32_t)lat lon:(int32_t)lon;

//! Latitude (degrees *10^7)
- (int32_t)lat;

//! Longitude (degrees *10^7)
- (int32_t)lon;

@end
