//
//  MVMessageCameraTrigger.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a CAMERA_TRIGGER Mavlink message.

 @discussion Camera-IMU triggering and synchronisation message.
 */
@interface MVMessageCameraTrigger : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec seq:(uint32_t)seq;

//! Timestamp for the image frame in microseconds
- (uint64_t)timeUsec;

//! Image frame sequence
- (uint32_t)seq;

@end
