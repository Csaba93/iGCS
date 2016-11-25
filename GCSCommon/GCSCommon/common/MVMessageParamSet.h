//
//  MVMessageParamSet.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a PARAM_SET Mavlink message.

 @discussion Set a parameter value TEMPORARILY to RAM. It will be reset to default on system reboot. Send the ACTION MAV_ACTION_STORAGE_WRITE to PERMANENTLY write the RAM contents to EEPROM. IMPORTANT: The receiving component should acknowledge the new parameter value by sending a param_value message to all communication partners. This will also ensure that multiple GCS all have an up-to-date list of all parameters. If the sending GCS did not receive a PARAM_VALUE message within its timeout time, it should re-send the PARAM_SET message.
 */
@interface MVMessageParamSet : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent paramId:(char *)paramId paramValue:(float)paramValue paramType:(MAV_PARAM_TYPE)paramType;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the ID is stored as string
- (NSString *)paramId;

//! Onboard parameter value
- (float)paramValue;

//! Onboard parameter type: see the MAV_PARAM_TYPE enum for supported data types.
- (MAV_PARAM_TYPE)paramType;

@end
