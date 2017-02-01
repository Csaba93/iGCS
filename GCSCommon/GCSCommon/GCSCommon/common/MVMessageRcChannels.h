//
//  MVMessageRcChannels.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a RC_CHANNELS Mavlink message.

 @discussion The PPM values of the RC channels received. The standard PPM modulation is as follows: 1000 microseconds: 0%, 2000 microseconds: 100%. Individual receivers/transmitters might violate this specification.
 */
@interface MVMessageRcChannels : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeBootMs:(uint32_t)timeBootMs chancount:(uint8_t)chancount chan1Raw:(uint16_t)chan1Raw chan2Raw:(uint16_t)chan2Raw chan3Raw:(uint16_t)chan3Raw chan4Raw:(uint16_t)chan4Raw chan5Raw:(uint16_t)chan5Raw chan6Raw:(uint16_t)chan6Raw chan7Raw:(uint16_t)chan7Raw chan8Raw:(uint16_t)chan8Raw chan9Raw:(uint16_t)chan9Raw chan10Raw:(uint16_t)chan10Raw chan11Raw:(uint16_t)chan11Raw chan12Raw:(uint16_t)chan12Raw chan13Raw:(uint16_t)chan13Raw chan14Raw:(uint16_t)chan14Raw chan15Raw:(uint16_t)chan15Raw chan16Raw:(uint16_t)chan16Raw chan17Raw:(uint16_t)chan17Raw chan18Raw:(uint16_t)chan18Raw rssi:(uint8_t)rssi;

//! Timestamp (milliseconds since system boot)
- (uint32_t)timeBootMs;

//! Total number of RC channels being received. This can be larger than 18, indicating that more channels are available but not given in this message. This value should be 0 when no RC channels are available.
- (uint8_t)chancount;

//! RC channel 1 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan1Raw;

//! RC channel 2 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan2Raw;

//! RC channel 3 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan3Raw;

//! RC channel 4 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan4Raw;

//! RC channel 5 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan5Raw;

//! RC channel 6 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan6Raw;

//! RC channel 7 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan7Raw;

//! RC channel 8 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan8Raw;

//! RC channel 9 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan9Raw;

//! RC channel 10 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan10Raw;

//! RC channel 11 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan11Raw;

//! RC channel 12 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan12Raw;

//! RC channel 13 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan13Raw;

//! RC channel 14 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan14Raw;

//! RC channel 15 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan15Raw;

//! RC channel 16 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan16Raw;

//! RC channel 17 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan17Raw;

//! RC channel 18 value, in microseconds. A value of UINT16_MAX implies the channel is unused.
- (uint16_t)chan18Raw;

//! Receive signal strength indicator, 0: 0%, 100: 100%, 255: invalid/unknown.
- (uint8_t)rssi;

@end
