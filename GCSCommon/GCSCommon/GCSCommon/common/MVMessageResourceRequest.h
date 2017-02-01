//
//  MVMessageResourceRequest.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a RESOURCE_REQUEST Mavlink message.

 @discussion The autopilot is requesting a resource (file, binary, other type of data)
 */
@interface MVMessageResourceRequest : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId requestId:(uint8_t)requestId uriType:(uint8_t)uriType uri:(uint8_t *)uri transferType:(uint8_t)transferType storage:(uint8_t *)storage;

//! Request ID. This ID should be re-used when sending back URI contents
- (uint8_t)requestId;

//! The type of requested URI. 0 = a file via URL. 1 = a UAVCAN binary
- (uint8_t)uriType;

//! The requested unique resource identifier (URI). It is not necessarily a straight domain name (depends on the URI type enum)
- (uint16_t)uri:(uint8_t *)uri;

//! The way the autopilot wants to receive the URI. 0 = MAVLink FTP. 1 = binary stream.
- (uint8_t)transferType;

//! The storage path the autopilot wants the URI to be stored in. Will only be valid if the transfer_type has a storage associated (e.g. MAVLink FTP).
- (uint16_t)storage:(uint8_t *)storage;

@end
