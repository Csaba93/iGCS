//
//  MVMessageDataTransmissionHandshake.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a DATA_TRANSMISSION_HANDSHAKE Mavlink message.

 @discussion 
 */
@interface MVMessageDataTransmissionHandshake : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId type:(uint8_t)type size:(uint32_t)size width:(uint16_t)width height:(uint16_t)height packets:(uint16_t)packets payload:(uint8_t)payload jpgQuality:(uint8_t)jpgQuality;

//! type of requested/acknowledged data (as defined in ENUM DATA_TYPES in mavlink/include/mavlink_types.h)
- (uint8_t)type;

//! total data size in bytes (set on ACK only)
- (uint32_t)size;

//! Width of a matrix or image
- (uint16_t)width;

//! Height of a matrix or image
- (uint16_t)height;

//! number of packets beeing sent (set on ACK only)
- (uint16_t)packets;

//! payload size per packet (normally 253 byte, see DATA field size in message ENCAPSULATED_DATA) (set on ACK only)
- (uint8_t)payload;

//! JPEG quality out of [1,100]
- (uint8_t)jpgQuality;

@end
