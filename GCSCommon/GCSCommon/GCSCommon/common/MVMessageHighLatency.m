//
//  MVMessageHighLatency.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageHighLatency.h"

@implementation MVMessageHighLatency

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId baseMode:(uint8_t)baseMode customMode:(uint32_t)customMode landedState:(MAV_LANDED_STATE)landedState roll:(int16_t)roll pitch:(int16_t)pitch heading:(uint16_t)heading throttle:(int8_t)throttle headingSp:(int16_t)headingSp latitude:(int32_t)latitude longitude:(int32_t)longitude altitudeAmsl:(int16_t)altitudeAmsl altitudeSp:(int16_t)altitudeSp airspeed:(uint8_t)airspeed airspeedSp:(uint8_t)airspeedSp groundspeed:(uint8_t)groundspeed climbRate:(int8_t)climbRate gpsNsat:(uint8_t)gpsNsat gpsFixType:(uint8_t)gpsFixType batteryRemaining:(uint8_t)batteryRemaining temperature:(int8_t)temperature temperatureAir:(int8_t)temperatureAir failsafe:(uint8_t)failsafe wpNum:(uint8_t)wpNum wpDistance:(uint16_t)wpDistance {
  if ((self = [super init])) {
    mavlink_msg_high_latency_pack(systemId, componentId, &(self->_message), baseMode, customMode, landedState, roll, pitch, heading, throttle, headingSp, latitude, longitude, altitudeAmsl, altitudeSp, airspeed, airspeedSp, groundspeed, climbRate, gpsNsat, gpsFixType, batteryRemaining, temperature, temperatureAir, failsafe, wpNum, wpDistance);
  }
  return self;
}

- (uint8_t)baseMode {
  return mavlink_msg_high_latency_get_base_mode(&(self->_message));
}

- (uint32_t)customMode {
  return mavlink_msg_high_latency_get_custom_mode(&(self->_message));
}

- (MAV_LANDED_STATE)landedState {
  return mavlink_msg_high_latency_get_landed_state(&(self->_message));
}

- (int16_t)roll {
  return mavlink_msg_high_latency_get_roll(&(self->_message));
}

- (int16_t)pitch {
  return mavlink_msg_high_latency_get_pitch(&(self->_message));
}

- (uint16_t)heading {
  return mavlink_msg_high_latency_get_heading(&(self->_message));
}

- (int8_t)throttle {
  return mavlink_msg_high_latency_get_throttle(&(self->_message));
}

- (int16_t)headingSp {
  return mavlink_msg_high_latency_get_heading_sp(&(self->_message));
}

- (int32_t)latitude {
  return mavlink_msg_high_latency_get_latitude(&(self->_message));
}

- (int32_t)longitude {
  return mavlink_msg_high_latency_get_longitude(&(self->_message));
}

- (int16_t)altitudeAmsl {
  return mavlink_msg_high_latency_get_altitude_amsl(&(self->_message));
}

- (int16_t)altitudeSp {
  return mavlink_msg_high_latency_get_altitude_sp(&(self->_message));
}

- (uint8_t)airspeed {
  return mavlink_msg_high_latency_get_airspeed(&(self->_message));
}

- (uint8_t)airspeedSp {
  return mavlink_msg_high_latency_get_airspeed_sp(&(self->_message));
}

- (uint8_t)groundspeed {
  return mavlink_msg_high_latency_get_groundspeed(&(self->_message));
}

- (int8_t)climbRate {
  return mavlink_msg_high_latency_get_climb_rate(&(self->_message));
}

- (uint8_t)gpsNsat {
  return mavlink_msg_high_latency_get_gps_nsat(&(self->_message));
}

- (uint8_t)gpsFixType {
  return mavlink_msg_high_latency_get_gps_fix_type(&(self->_message));
}

- (uint8_t)batteryRemaining {
  return mavlink_msg_high_latency_get_battery_remaining(&(self->_message));
}

- (int8_t)temperature {
  return mavlink_msg_high_latency_get_temperature(&(self->_message));
}

- (int8_t)temperatureAir {
  return mavlink_msg_high_latency_get_temperature_air(&(self->_message));
}

- (uint8_t)failsafe {
  return mavlink_msg_high_latency_get_failsafe(&(self->_message));
}

- (uint8_t)wpNum {
  return mavlink_msg_high_latency_get_wp_num(&(self->_message));
}

- (uint16_t)wpDistance {
  return mavlink_msg_high_latency_get_wp_distance(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, baseMode=%d, customMode=%d, landedState=%d, roll=%d, pitch=%d, heading=%d, throttle=%d, headingSp=%d, latitude=%d, longitude=%d, altitudeAmsl=%d, altitudeSp=%d, airspeed=%d, airspeedSp=%d, groundspeed=%d, climbRate=%d, gpsNsat=%d, gpsFixType=%d, batteryRemaining=%d, temperature=%d, temperatureAir=%d, failsafe=%d, wpNum=%d, wpDistance=%d", [super description], [self baseMode], [self customMode], [self landedState], [self roll], [self pitch], [self heading], [self throttle], [self headingSp], [self latitude], [self longitude], [self altitudeAmsl], [self altitudeSp], [self airspeed], [self airspeedSp], [self groundspeed], [self climbRate], [self gpsNsat], [self gpsFixType], [self batteryRemaining], [self temperature], [self temperatureAir], [self failsafe], [self wpNum], [self wpDistance]];
}

@end
