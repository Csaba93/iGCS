//
//  MVMessageFollowTarget.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a FOLLOW_TARGET Mavlink message.

 @discussion current motion information from a designated system
 */
@interface MVMessageFollowTarget : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timestamp:(uint64_t)timestamp estCapabilities:(uint8_t)estCapabilities lat:(int32_t)lat lon:(int32_t)lon alt:(float)alt vel:(float *)vel acc:(float *)acc attitudeQ:(float *)attitudeQ rates:(float *)rates positionCov:(float *)positionCov customState:(uint64_t)customState;

//! Timestamp in milliseconds since system boot
- (uint64_t)timestamp;

//! bit positions for tracker reporting capabilities (POS = 0, VEL = 1, ACCEL = 2, ATT + RATES = 3)
- (uint8_t)estCapabilities;

//! Latitude (WGS84), in degrees * 1E7
- (int32_t)lat;

//! Longitude (WGS84), in degrees * 1E7
- (int32_t)lon;

//! AMSL, in meters
- (float)alt;

//! target velocity (0,0,0) for unknown
- (uint16_t)vel:(float *)vel;

//! linear target acceleration (0,0,0) for unknown
- (uint16_t)acc:(float *)acc;

//! (1 0 0 0 for unknown)
- (uint16_t)attitudeQ:(float *)attitude_q;

//! (0 0 0 for unknown)
- (uint16_t)rates:(float *)rates;

//! eph epv
- (uint16_t)positionCov:(float *)position_cov;

//! button states or switches of a tracker device
- (uint64_t)customState;

@end
