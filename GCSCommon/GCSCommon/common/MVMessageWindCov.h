//
//  MVMessageWindCov.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a WIND_COV Mavlink message.

 @discussion 
 */
@interface MVMessageWindCov : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec windX:(float)windX windY:(float)windY windZ:(float)windZ varHoriz:(float)varHoriz varVert:(float)varVert windAlt:(float)windAlt horizAccuracy:(float)horizAccuracy vertAccuracy:(float)vertAccuracy;

//! Timestamp (micros since boot or Unix epoch)
- (uint64_t)timeUsec;

//! Wind in X (NED) direction in m/s
- (float)windX;

//! Wind in Y (NED) direction in m/s
- (float)windY;

//! Wind in Z (NED) direction in m/s
- (float)windZ;

//! Variability of the wind in XY. RMS of a 1 Hz lowpassed wind estimate.
- (float)varHoriz;

//! Variability of the wind in Z. RMS of a 1 Hz lowpassed wind estimate.
- (float)varVert;

//! AMSL altitude (m) this measurement was taken at
- (float)windAlt;

//! Horizontal speed 1-STD accuracy
- (float)horizAccuracy;

//! Vertical speed 1-STD accuracy
- (float)vertAccuracy;

@end
