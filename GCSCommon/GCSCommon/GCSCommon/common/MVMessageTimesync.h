//
//  MVMessageTimesync.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a TIMESYNC Mavlink message.

 @discussion Time synchronization message.
 */
@interface MVMessageTimesync : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId tc1:(int64_t)tc1 ts1:(int64_t)ts1;

//! Time sync timestamp 1
- (int64_t)tc1;

//! Time sync timestamp 2
- (int64_t)ts1;

@end
