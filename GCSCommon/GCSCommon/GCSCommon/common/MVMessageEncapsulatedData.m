//
//  MVMessageEncapsulatedData.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageEncapsulatedData.h"

@implementation MVMessageEncapsulatedData

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId seqnr:(uint16_t)seqnr data:(uint8_t *)data {
  if ((self = [super init])) {
    mavlink_msg_encapsulated_data_pack(systemId, componentId, &(self->_message), seqnr, data);
  }
  return self;
}

- (uint16_t)seqnr {
  return mavlink_msg_encapsulated_data_get_seqnr(&(self->_message));
}

- (uint16_t)data:(uint8_t *)data {
  return mavlink_msg_encapsulated_data_get_data(&(self->_message), data);
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, seqnr=%d, data=%@", [super description], [self seqnr], @"[array of uint8_t[253]]"];
}

@end
