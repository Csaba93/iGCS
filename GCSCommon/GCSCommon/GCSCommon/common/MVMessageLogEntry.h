//
//  MVMessageLogEntry.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOG_ENTRY Mavlink message.

 @discussion Reply to LOG_REQUEST_LIST
 */
@interface MVMessageLogEntry : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId id:(uint16_t)id numLogs:(uint16_t)numLogs lastLogNum:(uint16_t)lastLogNum timeUtc:(uint32_t)timeUtc size:(uint32_t)size;

//! Log id
- (uint16_t)id;

//! Total number of logs
- (uint16_t)numLogs;

//! High log number
- (uint16_t)lastLogNum;

//! UTC timestamp of log in seconds since 1970, or 0 if not available
- (uint32_t)timeUtc;

//! Size of the log (may be approximate) in bytes
- (uint32_t)size;

@end
