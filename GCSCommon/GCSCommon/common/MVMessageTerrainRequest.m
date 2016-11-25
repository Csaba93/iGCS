//
//  MVMessageTerrainRequest.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageTerrainRequest.h"

@implementation MVMessageTerrainRequest

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId lat:(int32_t)lat lon:(int32_t)lon gridSpacing:(uint16_t)gridSpacing mask:(uint64_t)mask {
  if ((self = [super init])) {
    mavlink_msg_terrain_request_pack(systemId, componentId, &(self->_message), lat, lon, gridSpacing, mask);
  }
  return self;
}

- (int32_t)lat {
  return mavlink_msg_terrain_request_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_terrain_request_get_lon(&(self->_message));
}

- (uint16_t)gridSpacing {
  return mavlink_msg_terrain_request_get_grid_spacing(&(self->_message));
}

- (uint64_t)mask {
  return mavlink_msg_terrain_request_get_mask(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, lat=%d, lon=%d, gridSpacing=%d, mask=0x%07x", [super description], [self lat], [self lon], [self gridSpacing], [self mask]];
}

@end
