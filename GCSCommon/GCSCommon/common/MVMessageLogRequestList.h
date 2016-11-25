//
//  MVMessageLogRequestList.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOG_REQUEST_LIST Mavlink message.

 @discussion Request a list of available logs. On some systems calling this may stop on-board logging until LOG_REQUEST_END is called.
 */
@interface MVMessageLogRequestList : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent start:(uint16_t)start end:(uint16_t)end;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! First log id (0 for first available)
- (uint16_t)start;

//! Last log id (0xffff for last available)
- (uint16_t)end;

@end
