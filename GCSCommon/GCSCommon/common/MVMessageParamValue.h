//
//  MVMessageParamValue.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a PARAM_VALUE Mavlink message.

 @discussion Emit the value of a onboard parameter. The inclusion of param_count and param_index in the message allows the recipient to keep track of received parameters and allows him to re-request missing parameters after a loss or timeout.
 */
@interface MVMessageParamValue : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId paramId:(char *)paramId paramValue:(float)paramValue paramType:(MAV_PARAM_TYPE)paramType paramCount:(uint16_t)paramCount paramIndex:(uint16_t)paramIndex;

//! Onboard parameter id, terminated by NULL if the length is less than 16 human-readable chars and WITHOUT null termination (NULL) byte if the length is exactly 16 chars - applications have to provide 16+1 bytes storage if the ID is stored as string
- (NSString *)paramId;

//! Onboard parameter value
- (float)paramValue;

//! Onboard parameter type: see the MAV_PARAM_TYPE enum for supported data types.
- (MAV_PARAM_TYPE)paramType;

//! Total number of onboard parameters
- (uint16_t)paramCount;

//! Index of this onboard parameter
- (uint16_t)paramIndex;

@end
