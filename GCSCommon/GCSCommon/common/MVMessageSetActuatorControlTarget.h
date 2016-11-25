//
//  MVMessageSetActuatorControlTarget.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_ACTUATOR_CONTROL_TARGET Mavlink message.

 @discussion Set the vehicle attitude and body angular rates.
 */
@interface MVMessageSetActuatorControlTarget : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec groupMlx:(uint8_t)groupMlx targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent controls:(float *)controls;

//! Timestamp (micros since boot or Unix epoch)
- (uint64_t)timeUsec;

//! Actuator group. The "_mlx" indicates this is a multi-instance message and a MAVLink parser should use this field to difference between instances.
- (uint8_t)groupMlx;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Actuator controls. Normed to -1..+1 where 0 is neutral position. Throttle for single rotation direction motors is 0..1, negative range for reverse direction. Standard mapping for attitude controls (group 0): (index 0-7): roll, pitch, yaw, throttle, flaps, spoilers, airbrakes, landing gear. Load a pass-through mixer to repurpose them as generic outputs.
- (uint16_t)controls:(float *)controls;

@end
