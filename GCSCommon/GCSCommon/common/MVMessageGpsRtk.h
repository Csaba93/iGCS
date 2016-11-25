//
//  MVMessageGpsRtk.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a GPS_RTK Mavlink message.

 @discussion RTK GPS data. Gives information on the relative baseline calculation the GPS is reporting
 */
@interface MVMessageGpsRtk : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeLastBaselineMs:(uint32_t)timeLastBaselineMs rtkReceiverId:(uint8_t)rtkReceiverId wn:(uint16_t)wn tow:(uint32_t)tow rtkHealth:(uint8_t)rtkHealth rtkRate:(uint8_t)rtkRate nsats:(uint8_t)nsats baselineCoordsType:(uint8_t)baselineCoordsType baselineAMm:(int32_t)baselineAMm baselineBMm:(int32_t)baselineBMm baselineCMm:(int32_t)baselineCMm accuracy:(uint32_t)accuracy iarNumHypotheses:(int32_t)iarNumHypotheses;

//! Time since boot of last baseline message received in ms.
- (uint32_t)timeLastBaselineMs;

//! Identification of connected RTK receiver.
- (uint8_t)rtkReceiverId;

//! GPS Week Number of last baseline
- (uint16_t)wn;

//! GPS Time of Week of last baseline
- (uint32_t)tow;

//! GPS-specific health report for RTK data.
- (uint8_t)rtkHealth;

//! Rate of baseline messages being received by GPS, in HZ
- (uint8_t)rtkRate;

//! Current number of sats used for RTK calculation.
- (uint8_t)nsats;

//! Coordinate system of baseline. 0 == ECEF, 1 == NED
- (uint8_t)baselineCoordsType;

//! Current baseline in ECEF x or NED north component in mm.
- (int32_t)baselineAMm;

//! Current baseline in ECEF y or NED east component in mm.
- (int32_t)baselineBMm;

//! Current baseline in ECEF z or NED down component in mm.
- (int32_t)baselineCMm;

//! Current estimate of baseline accuracy.
- (uint32_t)accuracy;

//! Current number of integer ambiguity hypotheses.
- (int32_t)iarNumHypotheses;

@end
