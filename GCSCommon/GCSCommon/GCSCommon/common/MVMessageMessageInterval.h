//
//  MVMessageMessageInterval.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a MESSAGE_INTERVAL Mavlink message.

 @discussion This interface replaces DATA_STREAM
 */
@interface MVMessageMessageInterval : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId messageId:(uint16_t)messageId intervalUs:(int32_t)intervalUs;

//! The ID of the requested MAVLink message. v1.0 is limited to 254 messages.
- (uint16_t)messageId;

//! The interval between two messages, in microseconds. A value of -1 indicates this stream is disabled, 0 indicates it is not available, > 0 indicates the interval at which it is sent.
- (int32_t)intervalUs;

@end
