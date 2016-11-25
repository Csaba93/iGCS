//
//  MVMessageResourceRequest.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageResourceRequest.h"

@implementation MVMessageResourceRequest

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId requestId:(uint8_t)requestId uriType:(uint8_t)uriType uri:(uint8_t *)uri transferType:(uint8_t)transferType storage:(uint8_t *)storage {
  if ((self = [super init])) {
    mavlink_msg_resource_request_pack(systemId, componentId, &(self->_message), requestId, uriType, uri, transferType, storage);
  }
  return self;
}

- (uint8_t)requestId {
  return mavlink_msg_resource_request_get_request_id(&(self->_message));
}

- (uint8_t)uriType {
  return mavlink_msg_resource_request_get_uri_type(&(self->_message));
}

- (uint16_t)uri:(uint8_t *)uri {
  return mavlink_msg_resource_request_get_uri(&(self->_message), uri);
}

- (uint8_t)transferType {
  return mavlink_msg_resource_request_get_transfer_type(&(self->_message));
}

- (uint16_t)storage:(uint8_t *)storage {
  return mavlink_msg_resource_request_get_storage(&(self->_message), storage);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, requestId=%d, uriType=%d, uri=%@, transferType=%d, storage=%@", [super description], [self requestId], [self uriType], @"[array of uint8_t[120]]", [self transferType], @"[array of uint8_t[120]]"];
}

@end
