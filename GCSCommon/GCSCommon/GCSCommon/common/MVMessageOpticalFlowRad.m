//
//  MVMessageOpticalFlowRad.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageOpticalFlowRad.h"

@implementation MVMessageOpticalFlowRad

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec sensorId:(uint8_t)sensorId integrationTimeUs:(uint32_t)integrationTimeUs integratedX:(float)integratedX integratedY:(float)integratedY integratedXgyro:(float)integratedXgyro integratedYgyro:(float)integratedYgyro integratedZgyro:(float)integratedZgyro temperature:(int16_t)temperature quality:(uint8_t)quality timeDeltaDistanceUs:(uint32_t)timeDeltaDistanceUs distance:(float)distance {
  if ((self = [super init])) {
    mavlink_msg_optical_flow_rad_pack(systemId, componentId, &(self->_message), timeUsec, sensorId, integrationTimeUs, integratedX, integratedY, integratedXgyro, integratedYgyro, integratedZgyro, temperature, quality, timeDeltaDistanceUs, distance);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_optical_flow_rad_get_time_usec(&(self->_message));
}

- (uint8_t)sensorId {
  return mavlink_msg_optical_flow_rad_get_sensor_id(&(self->_message));
}

- (uint32_t)integrationTimeUs {
  return mavlink_msg_optical_flow_rad_get_integration_time_us(&(self->_message));
}

- (float)integratedX {
  return mavlink_msg_optical_flow_rad_get_integrated_x(&(self->_message));
}

- (float)integratedY {
  return mavlink_msg_optical_flow_rad_get_integrated_y(&(self->_message));
}

- (float)integratedXgyro {
  return mavlink_msg_optical_flow_rad_get_integrated_xgyro(&(self->_message));
}

- (float)integratedYgyro {
  return mavlink_msg_optical_flow_rad_get_integrated_ygyro(&(self->_message));
}

- (float)integratedZgyro {
  return mavlink_msg_optical_flow_rad_get_integrated_zgyro(&(self->_message));
}

- (int16_t)temperature {
  return mavlink_msg_optical_flow_rad_get_temperature(&(self->_message));
}

- (uint8_t)quality {
  return mavlink_msg_optical_flow_rad_get_quality(&(self->_message));
}

- (uint32_t)timeDeltaDistanceUs {
  return mavlink_msg_optical_flow_rad_get_time_delta_distance_us(&(self->_message));
}

- (float)distance {
  return mavlink_msg_optical_flow_rad_get_distance(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, sensorId=%d, integrationTimeUs=%d, integratedX=%f, integratedY=%f, integratedXgyro=%f, integratedYgyro=%f, integratedZgyro=%f, temperature=%d, quality=%d, timeDeltaDistanceUs=%d, distance=%f", [super description], [self timeUsec], [self sensorId], [self integrationTimeUs], [self integratedX], [self integratedY], [self integratedXgyro], [self integratedYgyro], [self integratedZgyro], [self temperature], [self quality], [self timeDeltaDistanceUs], [self distance]];
}

@end
