//
//  MVMessageLocalPositionNedCov.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a LOCAL_POSITION_NED_COV Mavlink message.

 @discussion The filtered local position (e.g. fused computer vision and accelerometers). Coordinate frame is right-handed, Z-axis down (aeronautical frame, NED / north-east-down convention)
 */
@interface MVMessageLocalPositionNedCov : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId timeUsec:(uint64_t)timeUsec estimatorType:(MAV_ESTIMATOR_TYPE)estimatorType x:(float)x y:(float)y z:(float)z vx:(float)vx vy:(float)vy vz:(float)vz ax:(float)ax ay:(float)ay az:(float)az covariance:(float *)covariance;

//! Timestamp (microseconds since system boot or since UNIX epoch)
- (uint64_t)timeUsec;

//! Class id of the estimator this estimate originated from.
- (MAV_ESTIMATOR_TYPE)estimatorType;

//! X Position
- (float)x;

//! Y Position
- (float)y;

//! Z Position
- (float)z;

//! X Speed (m/s)
- (float)vx;

//! Y Speed (m/s)
- (float)vy;

//! Z Speed (m/s)
- (float)vz;

//! X Acceleration (m/s^2)
- (float)ax;

//! Y Acceleration (m/s^2)
- (float)ay;

//! Z Acceleration (m/s^2)
- (float)az;

//! Covariance matrix upper right triangular (first nine entries are the first ROW, next eight entries are the second row, etc.)
- (uint16_t)covariance:(float *)covariance;

@end
