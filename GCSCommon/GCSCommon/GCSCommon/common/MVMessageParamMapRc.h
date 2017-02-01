//
//  MVMessageParamMapRc.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a PARAM_MAP_RC Mavlink message.

 @discussion Bind a RC channel to a parameter. The parameter should change accoding to the RC channel value.
 */
@interface MVMessageParamMapRc : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem targetComponent:(uint8_t)targetComponent paramId:(char *)paramId paramIndex:(int16_t)paramIndex parameterRcChannelIndex:(uint8_t)parameterRcChannelIndex paramValue0:(float)paramValue0 scale:(float)scale paramValueMin:(float)paramValueMin paramValueMax:(float)paramValueMax;

//! System ID
- (uint8_t)targetSystem;

//! Component ID
- (uint8_t)targetComponent;

//! Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the ID is stored as string
- (NSString *)paramId;

//! Parameter index. Send -1 to use the param ID field as identifier (else the param id will be ignored), send -2 to disable any existing map for this rc_channel_index.
- (int16_t)paramIndex;

//! Index of parameter RC channel. Not equal to the RC channel id. Typically correpsonds to a potentiometer-knob on the RC.
- (uint8_t)parameterRcChannelIndex;

//! Initial parameter value
- (float)paramValue0;

//! Scale, maps the RC range [-1, 1] to a parameter value
- (float)scale;

//! Minimum param value. The protocol does not define if this overwrites an onboard minimum value. (Depends on implementation)
- (float)paramValueMin;

//! Maximum param value. The protocol does not define if this overwrites an onboard maximum value. (Depends on implementation)
- (float)paramValueMax;

@end
