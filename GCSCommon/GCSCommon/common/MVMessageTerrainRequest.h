//
//  MVMessageTerrainRequest.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a TERRAIN_REQUEST Mavlink message.

 @discussion Request for terrain data and terrain status
 */
@interface MVMessageTerrainRequest : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId lat:(int32_t)lat lon:(int32_t)lon gridSpacing:(uint16_t)gridSpacing mask:(uint64_t)mask;

//! Latitude of SW corner of first grid (degrees *10^7)
- (int32_t)lat;

//! Longitude of SW corner of first grid (in degrees *10^7)
- (int32_t)lon;

//! Grid spacing in meters
- (uint16_t)gridSpacing;

//! Bitmask of requested 4x4 grids (row major 8x7 array of grids, 56 bits)
- (uint64_t)mask;

@end
