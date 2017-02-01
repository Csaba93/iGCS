//
//  MVMessageAttPosMocap.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a ATT_POS_MOCAP Mavlink message.

 @discussion Motion capture attitude and position
 */
@interface MVMessageAttPosMocap : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec q:(float *)q x:(float)x y:(float)y z:(float)z;

//! Timestamp (micros since boot or Unix epoch)
- (uint64_t)timeUsec;

//! Attitude quaternion (w, x, y, z order, zero-rotation is 1, 0, 0, 0)
- (uint16_t)q:(float *)q;

//! X position in meters (NED)
- (float)x;

//! Y position in meters (NED)
- (float)y;

//! Z position in meters (NED)
- (float)z;

@end
