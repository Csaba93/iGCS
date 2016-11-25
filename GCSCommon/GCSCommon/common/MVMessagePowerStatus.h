//
//  MVMessagePowerStatus.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a POWER_STATUS Mavlink message.

 @discussion Power supply status
 */
@interface MVMessagePowerStatus : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId Vcc:(uint16_t)Vcc Vservo:(uint16_t)Vservo flags:(uint16_t)flags;

//! 5V rail voltage in millivolts
- (uint16_t)Vcc;

//! servo rail voltage in millivolts
- (uint16_t)Vservo;

//! power supply status flags (see MAV_POWER_STATUS enum)
- (uint16_t)flags;

@end
