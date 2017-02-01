//
//  MVMessageLandingTarget.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LANDING_TARGET Mavlink message.

 @discussion The location of a landing area captured from a downward facing camera
 */
@interface MVMessageLandingTarget : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec targetNum:(uint8_t)targetNum frame:(uint8_t)frame angleX:(float)angleX angleY:(float)angleY distance:(float)distance sizeX:(float)sizeX sizeY:(float)sizeY;

//! Timestamp (micros since boot or Unix epoch)
- (uint64_t)timeUsec;

//! The ID of the target if multiple targets are present
- (uint8_t)targetNum;

//! MAV_FRAME enum specifying the whether the following feilds are earth-frame, body-frame, etc.
- (uint8_t)frame;

//! X-axis angular offset (in radians) of the target from the center of the image
- (float)angleX;

//! Y-axis angular offset (in radians) of the target from the center of the image
- (float)angleY;

//! Distance to the target from the vehicle in meters
- (float)distance;

//! Size in radians of target along x-axis
- (float)sizeX;

//! Size in radians of target along y-axis
- (float)sizeY;

@end
