//
//  MVMessageAutopilotVersion.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageAutopilotVersion.h"

@implementation MVMessageAutopilotVersion

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId capabilities:(uint64_t)capabilities flightSwVersion:(uint32_t)flightSwVersion middlewareSwVersion:(uint32_t)middlewareSwVersion osSwVersion:(uint32_t)osSwVersion boardVersion:(uint32_t)boardVersion flightCustomVersion:(uint8_t *)flightCustomVersion middlewareCustomVersion:(uint8_t *)middlewareCustomVersion osCustomVersion:(uint8_t *)osCustomVersion vendorId:(uint16_t)vendorId productId:(uint16_t)productId uid:(uint64_t)uid {
  if ((self = [super init])) {
    mavlink_msg_autopilot_version_pack(systemId, componentId, &(self->_message), capabilities, flightSwVersion, middlewareSwVersion, osSwVersion, boardVersion, flightCustomVersion, middlewareCustomVersion, osCustomVersion, vendorId, productId, uid);
  }
  return self;
}

- (uint64_t)capabilities {
  return mavlink_msg_autopilot_version_get_capabilities(&(self->_message));
}

- (uint32_t)flightSwVersion {
  return mavlink_msg_autopilot_version_get_flight_sw_version(&(self->_message));
}

- (uint32_t)middlewareSwVersion {
  return mavlink_msg_autopilot_version_get_middleware_sw_version(&(self->_message));
}

- (uint32_t)osSwVersion {
  return mavlink_msg_autopilot_version_get_os_sw_version(&(self->_message));
}

- (uint32_t)boardVersion {
  return mavlink_msg_autopilot_version_get_board_version(&(self->_message));
}

- (uint16_t)flightCustomVersion:(uint8_t *)flight_custom_version {
  return mavlink_msg_autopilot_version_get_flight_custom_version(&(self->_message), flight_custom_version);
}

- (uint16_t)middlewareCustomVersion:(uint8_t *)middleware_custom_version {
  return mavlink_msg_autopilot_version_get_middleware_custom_version(&(self->_message), middleware_custom_version);
}

- (uint16_t)osCustomVersion:(uint8_t *)os_custom_version {
  return mavlink_msg_autopilot_version_get_os_custom_version(&(self->_message), os_custom_version);
}

- (uint16_t)vendorId {
  return mavlink_msg_autopilot_version_get_vendor_id(&(self->_message));
}

- (uint16_t)productId {
  return mavlink_msg_autopilot_version_get_product_id(&(self->_message));
}

- (uint64_t)uid {
  return mavlink_msg_autopilot_version_get_uid(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, capabilities=%lld, flightSwVersion=%d, middlewareSwVersion=%d, osSwVersion=%d, boardVersion=%d, flightCustomVersion=%@, middlewareCustomVersion=%@, osCustomVersion=%@, vendorId=%d, productId=%d, uid=%lld", [super description], [self capabilities], [self flightSwVersion], [self middlewareSwVersion], [self osSwVersion], [self boardVersion], @"[array of uint8_t[8]]", @"[array of uint8_t[8]]", @"[array of uint8_t[8]]", [self vendorId], [self productId], [self uid]];
}

@end
