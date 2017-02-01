//
//  MVMessageLogData.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOG_DATA Mavlink message.

 @discussion Reply to LOG_REQUEST_DATA
 */
@interface MVMessageLogData : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId id:(uint16_t)id ofs:(uint32_t)ofs count:(uint8_t)count data:(uint8_t *)data;

//! Log id (from LOG_ENTRY reply)
- (uint16_t)id;

//! Offset into the log
- (uint32_t)ofs;

//! Number of bytes (zero for end of log)
- (uint8_t)count;

//! log data
- (uint16_t)data:(uint8_t *)data;

@end
