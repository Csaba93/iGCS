//
//  MVMessageTerrainData.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a TERRAIN_DATA Mavlink message.

 @discussion Terrain data sent from GCS. The lat/lon and grid_spacing must be the same as a lat/lon from a TERRAIN_REQUEST
 */
@interface MVMessageTerrainData : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId lat:(int32_t)lat lon:(int32_t)lon gridSpacing:(uint16_t)gridSpacing gridbit:(uint8_t)gridbit data:(int16_t *)data;

//! Latitude of SW corner of first grid (degrees *10^7)
- (int32_t)lat;

//! Longitude of SW corner of first grid (in degrees *10^7)
- (int32_t)lon;

//! Grid spacing in meters
- (uint16_t)gridSpacing;

//! bit within the terrain request mask
- (uint8_t)gridbit;

//! Terrain data in meters AMSL
- (uint16_t)data:(int16_t *)data;

@end
