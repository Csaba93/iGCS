//
//  MVMessageTerrainReport.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageTerrainReport.h"

@implementation MVMessageTerrainReport

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId lat:(int32_t)lat lon:(int32_t)lon spacing:(uint16_t)spacing terrainHeight:(float)terrainHeight currentHeight:(float)currentHeight pending:(uint16_t)pending loaded:(uint16_t)loaded {
  if ((self = [super init])) {
    mavlink_msg_terrain_report_pack(systemId, componentId, &(self->_message), lat, lon, spacing, terrainHeight, currentHeight, pending, loaded);
  }
  return self;
}

- (int32_t)lat {
  return mavlink_msg_terrain_report_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_terrain_report_get_lon(&(self->_message));
}

- (uint16_t)spacing {
  return mavlink_msg_terrain_report_get_spacing(&(self->_message));
}

- (float)terrainHeight {
  return mavlink_msg_terrain_report_get_terrain_height(&(self->_message));
}

- (float)currentHeight {
  return mavlink_msg_terrain_report_get_current_height(&(self->_message));
}

- (uint16_t)pending {
  return mavlink_msg_terrain_report_get_pending(&(self->_message));
}

- (uint16_t)loaded {
  return mavlink_msg_terrain_report_get_loaded(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, lat=%d, lon=%d, spacing=%d, terrainHeight=%f, currentHeight=%f, pending=%d, loaded=%d", [super description], [self lat], [self lon], [self spacing], [self terrainHeight], [self currentHeight], [self pending], [self loaded]];
}

@end
