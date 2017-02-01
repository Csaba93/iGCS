//
//  MVMessageLogRequestData.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOG_REQUEST_DATA Mavlink message.

 @discussion Request a chunk of a log
 */
@interface MVMessageLogRequestData : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent id:(uint16_t)id ofs:(uint32_t)ofs count:(uint32_t)count;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Log id (from LOG_ENTRY reply)
- (uint16_t)id;

//! Offset into the log
- (uint32_t)ofs;

//! Number of bytes
- (uint32_t)count;

@end
