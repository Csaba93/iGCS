//
//  MVMessageTerrainData.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageTerrainData.h"

@implementation MVMessageTerrainData

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId lat:(int32_t)lat lon:(int32_t)lon gridSpacing:(uint16_t)gridSpacing gridbit:(uint8_t)gridbit data:(int16_t *)data {
  if ((self = [super init])) {
    mavlink_msg_terrain_data_pack(systemId, componentId, &(self->_message), lat, lon, gridSpacing, gridbit, data);
  }
  return self;
}

- (int32_t)lat {
  return mavlink_msg_terrain_data_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_terrain_data_get_lon(&(self->_message));
}

- (uint16_t)gridSpacing {
  return mavlink_msg_terrain_data_get_grid_spacing(&(self->_message));
}

- (uint8_t)gridbit {
  return mavlink_msg_terrain_data_get_gridbit(&(self->_message));
}

- (uint16_t)data:(int16_t *)data {
  return mavlink_msg_terrain_data_get_data(&(self->_message), data);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, lat=%d, lon=%d, gridSpacing=%d, gridbit=%d, data=%@", [super description], [self lat], [self lon], [self gridSpacing], [self gridbit], @"[array of int16_t[16]]"];
}

@end
