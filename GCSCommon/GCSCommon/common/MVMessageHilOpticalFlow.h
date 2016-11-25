//
//  MVMessageHilOpticalFlow.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a HIL_OPTICAL_FLOW Mavlink message.

 @discussion Simulated optical flow from a flow sensor (e.g. PX4FLOW or optical mouse sensor)
 */
@interface MVMessageHilOpticalFlow : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec sensorId:(uint8_t)sensorId integrationTimeUs:(uint32_t)integrationTimeUs integratedX:(float)integratedX integratedY:(float)integratedY integratedXgyro:(float)integratedXgyro integratedYgyro:(float)integratedYgyro integratedZgyro:(float)integratedZgyro temperature:(int16_t)temperature quality:(uint8_t)quality timeDeltaDistanceUs:(uint32_t)timeDeltaDistanceUs distance:(float)distance;

//! Timestamp (microseconds, synced to UNIX time or since system boot)
- (uint64_t)timeUsec;

//! Sensor ID
- (uint8_t)sensorId;

//! Integration time in microseconds. Divide integrated_x and integrated_y by the integration time to obtain average flow. The integration time also indicates the.
- (uint32_t)integrationTimeUs;

//! Flow in radians around X axis (Sensor RH rotation about the X axis induces a positive flow. Sensor linear motion along the positive Y axis induces a negative flow.)
- (float)integratedX;

//! Flow in radians around Y axis (Sensor RH rotation about the Y axis induces a positive flow. Sensor linear motion along the positive X axis induces a positive flow.)
- (float)integratedY;

//! RH rotation around X axis (rad)
- (float)integratedXgyro;

//! RH rotation around Y axis (rad)
- (float)integratedYgyro;

//! RH rotation around Z axis (rad)
- (float)integratedZgyro;

//! Temperature * 100 in centi-degrees Celsius
- (int16_t)temperature;

//! Optical flow quality / confidence. 0: no valid flow, 255: maximum quality
- (uint8_t)quality;

//! Time in microseconds since the distance was sampled.
- (uint32_t)timeDeltaDistanceUs;

//! Distance to the center of the flow field in meters. Positive value (including zero): distance known. Negative value: Unknown distance.
- (float)distance;

@end
