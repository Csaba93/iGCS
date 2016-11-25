//
//  MVMessageV2Extension.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a V2_EXTENSION Mavlink message.

 @discussion Message implementing parts of the V2 payload specs in V1 frames for transitional support.
 */
@interface MVMessageV2Extension : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetNetwork:(uint8_t)targetNetwork targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent messageType:(uint16_t)messageType payload:(uint8_t *)payload;

//! Network ID (0 for broadcast)
- (uint8_t)targetNetwork;

//! System ID (0 for broadcast)
- (uint8_t)targetSystem;

//! Component ID (0 for broadcast)
- (uint8_t)targetComponent;

//! A code that identifies the software component that understands this message (analogous to usb device classes or mime type strings).  If this code is less than 32768, it is considered a 'registered' protocol extension and the corresponding entry should be added to https://github.com/mavlink/mavlink/extension-message-ids.xml.  Software creators can register blocks of message IDs as needed (useful for GCS specific metadata, etc...). Message_types greater than 32767 are considered local experiments and should not be checked in to any widely distributed codebase.
- (uint16_t)messageType;

//! Variable length payload. The length is defined by the remaining message length when subtracting the header and other fields.  The entire content of this block is opaque unless you understand any the encoding message_type.  The particular encoding used can be extension specific and might not always be documented as part of the mavlink specification.
- (uint16_t)payload:(uint8_t *)payload;

@end
