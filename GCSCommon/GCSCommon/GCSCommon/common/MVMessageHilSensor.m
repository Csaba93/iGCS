//
//  MVMessageHilSensor.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHilSensor.h"

@implementation MVMessageHilSensor

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec xacc:(float)xacc yacc:(float)yacc zacc:(float)zacc xgyro:(float)xgyro ygyro:(float)ygyro zgyro:(float)zgyro xmag:(float)xmag ymag:(float)ymag zmag:(float)zmag absPressure:(float)absPressure diffPressure:(float)diffPressure pressureAlt:(float)pressureAlt temperature:(float)temperature fieldsUpdated:(uint32_t)fieldsUpdated {
  if ((self = [super init])) {
    mavlink_msg_hil_sensor_pack(systemId, componentId, &(self->_message), timeUsec, xacc, yacc, zacc, xgyro, ygyro, zgyro, xmag, ymag, zmag, absPressure, diffPressure, pressureAlt, temperature, fieldsUpdated);
  }
  return self;
}

- (uint64_t)timeUsec {
  return mavlink_msg_hil_sensor_get_time_usec(&(self->_message));
}

- (float)xacc {
  return mavlink_msg_hil_sensor_get_xacc(&(self->_message));
}

- (float)yacc {
  return mavlink_msg_hil_sensor_get_yacc(&(self->_message));
}

- (float)zacc {
  return mavlink_msg_hil_sensor_get_zacc(&(self->_message));
}

- (float)xgyro {
  return mavlink_msg_hil_sensor_get_xgyro(&(self->_message));
}

- (float)ygyro {
  return mavlink_msg_hil_sensor_get_ygyro(&(self->_message));
}

- (float)zgyro {
  return mavlink_msg_hil_sensor_get_zgyro(&(self->_message));
}

- (float)xmag {
  return mavlink_msg_hil_sensor_get_xmag(&(self->_message));
}

- (float)ymag {
  return mavlink_msg_hil_sensor_get_ymag(&(self->_message));
}

- (float)zmag {
  return mavlink_msg_hil_sensor_get_zmag(&(self->_message));
}

- (float)absPressure {
  return mavlink_msg_hil_sensor_get_abs_pressure(&(self->_message));
}

- (float)diffPressure {
  return mavlink_msg_hil_sensor_get_diff_pressure(&(self->_message));
}

- (float)pressureAlt {
  return mavlink_msg_hil_sensor_get_pressure_alt(&(self->_message));
}

- (float)temperature {
  return mavlink_msg_hil_sensor_get_temperature(&(self->_message));
}

- (uint32_t)fieldsUpdated {
  return mavlink_msg_hil_sensor_get_fields_updated(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeUsec=%lld, xacc=%f, yacc=%f, zacc=%f, xgyro=%f, ygyro=%f, zgyro=%f, xmag=%f, ymag=%f, zmag=%f, absPressure=%f, diffPressure=%f, pressureAlt=%f, temperature=%f, fieldsUpdated=%d", [super description], [self timeUsec], [self xacc], [self yacc], [self zacc], [self xgyro], [self ygyro], [self zgyro], [self xmag], [self ymag], [self zmag], [self absPressure], [self diffPressure], [self pressureAlt], [self temperature], [self fieldsUpdated]];
}

@end
