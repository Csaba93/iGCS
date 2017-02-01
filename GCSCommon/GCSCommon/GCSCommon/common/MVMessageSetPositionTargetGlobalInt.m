//
//  MVMessageSetPositionTargetGlobalInt.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageSetPositionTargetGlobalInt.h"

@implementation MVMessageSetPositionTargetGlobalInt

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent coordinateFrame:(MAV_FRAME)coordinateFrame typeMask:(uint16_t)typeMask latInt:(int32_t)latInt lonInt:(int32_t)lonInt alt:(float)alt vx:(float)vx vy:(float)vy vz:(float)vz afx:(float)afx afy:(float)afy afz:(float)afz yaw:(float)yaw yawRate:(float)yawRate {
  if ((self = [super init])) {
    mavlink_msg_set_position_target_global_int_pack(systemId, componentId, &(self->_message), timeBootMs, targetSystem, targetComponent, coordinateFrame, typeMask, latInt, lonInt, alt, vx, vy, vz, afx, afy, afz, yaw, yawRate);
  }
  return self;
}

- (uint32_t)timeBootMs {
  return mavlink_msg_set_position_target_global_int_get_time_boot_ms(&(self->_message));
}

- (uint8_t)targetSystem {
  return mavlink_msg_set_position_target_global_int_get_target_system(&(self->_message));
}

- (uint8_t)targetComponent {
  return mavlink_msg_set_position_target_global_int_get_target_component(&(self->_message));
}

- (MAV_FRAME)coordinateFrame {
  return mavlink_msg_set_position_target_global_int_get_coordinate_frame(&(self->_message));
}

- (uint16_t)typeMask {
  return mavlink_msg_set_position_target_global_int_get_type_mask(&(self->_message));
}

- (int32_t)latInt {
  return mavlink_msg_set_position_target_global_int_get_lat_int(&(self->_message));
}

- (int32_t)lonInt {
  return mavlink_msg_set_position_target_global_int_get_lon_int(&(self->_message));
}

- (float)alt {
  return mavlink_msg_set_position_target_global_int_get_alt(&(self->_message));
}

- (float)vx {
  return mavlink_msg_set_position_target_global_int_get_vx(&(self->_message));
}

- (float)vy {
  return mavlink_msg_set_position_target_global_int_get_vy(&(self->_message));
}

- (float)vz {
  return mavlink_msg_set_position_target_global_int_get_vz(&(self->_message));
}

- (float)afx {
  return mavlink_msg_set_position_target_global_int_get_afx(&(self->_message));
}

- (float)afy {
  return mavlink_msg_set_position_target_global_int_get_afy(&(self->_message));
}

- (float)afz {
  return mavlink_msg_set_position_target_global_int_get_afz(&(self->_message));
}

- (float)yaw {
  return mavlink_msg_set_position_target_global_int_get_yaw(&(self->_message));
}

- (float)yawRate {
  return mavlink_msg_set_position_target_global_int_get_yaw_rate(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeBootMs=%d, targetSystem=%d, targetComponent=%d, coordinateFrame=%d, typeMask=%d, latInt=%d, lonInt=%d, alt=%f, vx=%f, vy=%f, vz=%f, afx=%f, afy=%f, afz=%f, yaw=%f, yawRate=%f", [super description], [self timeBootMs], [self targetSystem], [self targetComponent], [self coordinateFrame], [self typeMask], [self latInt], [self lonInt], [self alt], [self vx], [self vy], [self vz], [self afx], [self afy], [self afz], [self yaw], [self yawRate]];
}

@end
