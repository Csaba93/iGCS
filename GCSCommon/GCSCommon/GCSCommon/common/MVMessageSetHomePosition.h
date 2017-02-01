//
//  MVMessageSetHomePosition.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SET_HOME_POSITION Mavlink message.

 @discussion The position the system will return to and land on. The position is set automatically by the system during the takeoff in case it was not explicitely set by the operator before or after. The global and local positions encode the position in the respective coordinate frames, while the q parameter encodes the orientation of the surface. Under normal conditions it describes the heading and terrain slope, which can be used by the aircraft to adjust the approach. The approach 3D vector describes the point to which the system should fly in normal flight mode and then perform a landing sequence along the vector.
 */
@interface MVMessageSetHomePosition : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId targetSystem:(uint8_t)targetSystem latitude:(int32_t)latitude longitude:(int32_t)longitude altitude:(int32_t)altitude x:(float)x y:(float)y z:(float)z q:(float *)q approachX:(float)approachX approachY:(float)approachY approachZ:(float)approachZ;

//! System ID.
- (uint8_t)targetSystem;

//! Latitude (WGS84), in degrees * 1E7
- (int32_t)latitude;

//! Longitude (WGS84, in degrees * 1E7
- (int32_t)longitude;

//! Altitude (AMSL), in meters * 1000 (positive for up)
- (int32_t)altitude;

//! Local X position of this position in the local coordinate frame
- (float)x;

//! Local Y position of this position in the local coordinate frame
- (float)y;

//! Local Z position of this position in the local coordinate frame
- (float)z;

//! World to surface normal and heading transformation of the takeoff position. Used to indicate the heading and slope of the ground
- (uint16_t)q:(float *)q;

//! Local X position of the end of the approach vector. Multicopters should set this position based on their takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened from the threshold / touchdown zone.
- (float)approachX;

//! Local Y position of the end of the approach vector. Multicopters should set this position based on their takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened from the threshold / touchdown zone.
- (float)approachY;

//! Local Z position of the end of the approach vector. Multicopters should set this position based on their takeoff path. Grass-landing fixed wing aircraft should set it the same way as multicopters. Runway-landing fixed wing aircraft should set it to the opposite direction of the takeoff, assuming the takeoff happened from the threshold / touchdown zone.
- (float)approachZ;

@end
