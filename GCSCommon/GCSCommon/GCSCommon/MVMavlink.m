//
//  MVMavlink.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMavlink.h"

@implementation MVMavlink

- (void)parseData:(NSData *)data {
  mavlink_message_t msg;
  mavlink_status_t status;
  char *bytes = (char *)[data bytes];

  for (NSInteger i = 0; i < [data length]; ++i) {
    if (mavlink_parse_char(MAVLINK_COMM_0, bytes[i], &msg, &status)) {
      // Packet received
      id<MVMessage> message = [MVMessage messageWithCMessage:msg];
      [_delegate mavlink:self didGetMessage:message];
    }
  }
}

- (BOOL)sendMessage:(id<MVMessage>)message {
  return [_delegate mavlink:self shouldWriteData:[message data]];
}

@end
