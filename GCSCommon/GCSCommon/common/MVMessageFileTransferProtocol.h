//
//  MVMessageFileTransferProtocol.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a FILE_TRANSFER_PROTOCOL Mavlink message.

 @discussion File transfer message
 */
@interface MVMessageFileTransferProtocol : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetNetwork:(uint8_t)targetNetwork targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent payload:(uint8_t *)payload;

//! Network ID (0 for broadcast)
- (uint8_t)targetNetwork;

//! System ID (0 for broadcast)
- (uint8_t)targetSystem;

//! Component ID (0 for broadcast)
- (uint8_t)targetComponent;

//! Variable length payload. The length is defined by the remaining message length when subtracting the header and other fields.  The entire content of this block is opaque unless you understand any the encoding message_type.  The particular encoding used can be extension specific and might not always be documented as part of the mavlink specification.
- (uint16_t)payload:(uint8_t *)payload;

@end
