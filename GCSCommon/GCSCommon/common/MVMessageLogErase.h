//
//  MVMessageLogErase.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOG_ERASE Mavlink message.

 @discussion Erase all logs
 */
@interface MVMessageLogErase : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

@end
