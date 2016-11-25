//
//  MVMessageGpsInjectData.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS_INJECT_DATA Mavlink message.

 @discussion data for injecting into the onboard GPS (used for DGPS)
 */
@interface MVMessageGpsInjectData : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent len:(uint8_t)len data:(uint8_t *)data;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! data length
- (uint8_t)len;

//! raw data (110 is enough for 12 satellites of RTCMv2)
- (uint16_t)data:(uint8_t *)data;

@end
