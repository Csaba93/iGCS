//
//  MVMessageTerrainCheck.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageTerrainCheck.h"

@implementation MVMessageTerrainCheck

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId lat:(int32_t)lat lon:(int32_t)lon {
  if ((self = [super init])) {
    mavlink_msg_terrain_check_pack(systemId, componentId, &(self->_message), lat, lon);
  }
  return self;
}

- (int32_t)lat {
  return mavlink_msg_terrain_check_get_lat(&(self->_message));
}

- (int32_t)lon {
  return mavlink_msg_terrain_check_get_lon(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, lat=%d, lon=%d", [super description], [self lat], [self lon]];
}

@end
