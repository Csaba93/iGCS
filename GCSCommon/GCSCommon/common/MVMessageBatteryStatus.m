//
//  MVMessageBatteryStatus.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageBatteryStatus.h"

@implementation MVMessageBatteryStatus

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId id:(uint8_t)id batteryFunction:(MAV_BATTERY_FUNCTION)batteryFunction type:(MAV_BATTERY_TYPE)type temperature:(int16_t)temperature voltages:(uint16_t *)voltages currentBattery:(int16_t)currentBattery currentConsumed:(int32_t)currentConsumed energyConsumed:(int32_t)energyConsumed batteryRemaining:(int8_t)batteryRemaining {
  if ((self = [super init])) {
    mavlink_msg_battery_status_pack(systemId, componentId, &(self->_message), id, batteryFunction, type, temperature, voltages, currentBattery, currentConsumed, energyConsumed, batteryRemaining);
  }
  return self;
}

- (uint8_t)id {
  return mavlink_msg_battery_status_get_id(&(self->_message));
}

- (MAV_BATTERY_FUNCTION)batteryFunction {
  return mavlink_msg_battery_status_get_battery_function(&(self->_message));
}

- (MAV_BATTERY_TYPE)type {
  return mavlink_msg_battery_status_get_type(&(self->_message));
}

- (int16_t)temperature {
  return mavlink_msg_battery_status_get_temperature(&(self->_message));
}

- (uint16_t)voltages:(uint16_t *)voltages {
  return mavlink_msg_battery_status_get_voltages(&(self->_message), voltages);
}

- (int16_t)currentBattery {
  return mavlink_msg_battery_status_get_current_battery(&(self->_message));
}

- (int32_t)currentConsumed {
  return mavlink_msg_battery_status_get_current_consumed(&(self->_message));
}

- (int32_t)energyConsumed {
  return mavlink_msg_battery_status_get_energy_consumed(&(self->_message));
}

- (int8_t)batteryRemaining {
  return mavlink_msg_battery_status_get_battery_remaining(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, id=%d, batteryFunction=%d, type=%d, temperature=%d, voltages=%@, currentBattery=%d, currentConsumed=%d, energyConsumed=%d, batteryRemaining=%d", [super description], [self id], [self batteryFunction], [self type], [self temperature], @"[array of uint16_t[10]]", [self currentBattery], [self currentConsumed], [self energyConsumed], [self batteryRemaining]];
}

@end
