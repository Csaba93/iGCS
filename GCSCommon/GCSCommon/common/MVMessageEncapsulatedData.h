//
//  MVMessageEncapsulatedData.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ENCAPSULATED_DATA Mavlink message.

 @discussion 
 */
@interface MVMessageEncapsulatedData : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId seqnr:(uint16_t)seqnr data:(uint8_t *)data;

//! sequence number (starting with 0 on every transmission)
- (uint16_t)seqnr;

//! image data bytes
- (uint16_t)data:(uint8_t *)data;

@end
