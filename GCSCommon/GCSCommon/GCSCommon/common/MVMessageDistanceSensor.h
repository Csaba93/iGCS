//
//  MVMessageDistanceSensor.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a DISTANCE_SENSOR Mavlink message.

 @discussion 
 */
@interface MVMessageDistanceSensor : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs minDistance:(uint16_t)minDistance maxDistance:(uint16_t)maxDistance currentDistance:(uint16_t)currentDistance type:(uint8_t)type id:(uint8_t)id orientation:(uint8_t)orientation covariance:(uint8_t)covariance;

//! Time since system boot
- (uint32_t)timeBootMs;

//! Minimum distance the sensor can measure in centimeters
- (uint16_t)minDistance;

//! Maximum distance the sensor can measure in centimeters
- (uint16_t)maxDistance;

//! Current distance reading
- (uint16_t)currentDistance;

//! Type from MAV_DISTANCE_SENSOR enum.
- (uint8_t)type;

//! Onboard ID of the sensor
- (uint8_t)id;

//! Direction the sensor faces from MAV_SENSOR_ORIENTATION enum.
- (uint8_t)orientation;

//! Measurement covariance in centimeters, 0 for unknown / invalid readings
- (uint8_t)covariance;

@end
