//
//  MVMessageScaledPressure2.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SCALED_PRESSURE2 Mavlink message.

 @discussion Barometer readings for 2nd barometer
 */
@interface MVMessageScaledPressure2 : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs pressAbs:(float)pressAbs pressDiff:(float)pressDiff temperature:(int16_t)temperature;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! Absolute pressure (hectopascal)
- (float)pressAbs;

//! Differential pressure 1 (hectopascal)
- (float)pressDiff;

//! Temperature measurement (0.01 degrees celsius)
- (int16_t)temperature;

@end
