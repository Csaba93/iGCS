//
//  MVMessageGps2Rtk.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessageGps2Rtk.h"

@implementation MVMessageGps2Rtk

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeLastBaselineMs:(uint32_t)timeLastBaselineMs rtkReceiverId:(uint8_t)rtkReceiverId wn:(uint16_t)wn tow:(uint32_t)tow rtkHealth:(uint8_t)rtkHealth rtkRate:(uint8_t)rtkRate nsats:(uint8_t)nsats baselineCoordsType:(uint8_t)baselineCoordsType baselineAMm:(int32_t)baselineAMm baselineBMm:(int32_t)baselineBMm baselineCMm:(int32_t)baselineCMm accuracy:(uint32_t)accuracy iarNumHypotheses:(int32_t)iarNumHypotheses {
  if ((self = [super init])) {
    mavlink_msg_gps2_rtk_pack(systemId, componentId, &(self->_message), timeLastBaselineMs, rtkReceiverId, wn, tow, rtkHealth, rtkRate, nsats, baselineCoordsType, baselineAMm, baselineBMm, baselineCMm, accuracy, iarNumHypotheses);
  }
  return self;
}

- (uint32_t)timeLastBaselineMs {
  return mavlink_msg_gps2_rtk_get_time_last_baseline_ms(&(self->_message));
}

- (uint8_t)rtkReceiverId {
  return mavlink_msg_gps2_rtk_get_rtk_receiver_id(&(self->_message));
}

- (uint16_t)wn {
  return mavlink_msg_gps2_rtk_get_wn(&(self->_message));
}

- (uint32_t)tow {
  return mavlink_msg_gps2_rtk_get_tow(&(self->_message));
}

- (uint8_t)rtkHealth {
  return mavlink_msg_gps2_rtk_get_rtk_health(&(self->_message));
}

- (uint8_t)rtkRate {
  return mavlink_msg_gps2_rtk_get_rtk_rate(&(self->_message));
}

- (uint8_t)nsats {
  return mavlink_msg_gps2_rtk_get_nsats(&(self->_message));
}

- (uint8_t)baselineCoordsType {
  return mavlink_msg_gps2_rtk_get_baseline_coords_type(&(self->_message));
}

- (int32_t)baselineAMm {
  return mavlink_msg_gps2_rtk_get_baseline_a_mm(&(self->_message));
}

- (int32_t)baselineBMm {
  return mavlink_msg_gps2_rtk_get_baseline_b_mm(&(self->_message));
}

- (int32_t)baselineCMm {
  return mavlink_msg_gps2_rtk_get_baseline_c_mm(&(self->_message));
}

- (uint32_t)accuracy {
  return mavlink_msg_gps2_rtk_get_accuracy(&(self->_message));
}

- (int32_t)iarNumHypotheses {
  return mavlink_msg_gps2_rtk_get_iar_num_hypotheses(&(self->_message));
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, timeLastBaselineMs=%d, rtkReceiverId=%d, wn=%d, tow=%d, rtkHealth=%d, rtkRate=%d, nsats=%d, baselineCoordsType=%d, baselineAMm=%d, baselineBMm=%d, baselineCMm=%d, accuracy=%d, iarNumHypotheses=%d", [super description], [self timeLastBaselineMs], [self rtkReceiverId], [self wn], [self tow], [self rtkHealth], [self rtkRate], [self nsats], [self baselineCoordsType], [self baselineAMm], [self baselineBMm], [self baselineCMm], [self accuracy], [self iarNumHypotheses]];
}

@end
