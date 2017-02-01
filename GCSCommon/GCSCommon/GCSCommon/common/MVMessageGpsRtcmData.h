//
//  MVMessageGpsRtcmData.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS_RTCM_DATA Mavlink message.

 @discussion WORK IN PROGRESS! RTCM message for injecting into the onboard GPS (used for DGPS)
 */
@interface MVMessageGpsRtcmData : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId flags:(uint8_t)flags len:(uint8_t)len data:(uint8_t *)data;

//! LSB: 1 means message is fragmented
- (uint8_t)flags;

//! data length
- (uint8_t)len;

//! RTCM message (may be fragmented)
- (uint16_t)data:(uint8_t *)data;

@end
