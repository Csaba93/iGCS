//
//  MVMessageSysStatus.h
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"

/*!
 Class that represents a SYS_STATUS Mavlink message.

 @discussion The general system state. If the system is following the MAVLink standard, the system state is mainly defined by three orthogonal states/modes: The system mode, which is either LOCKED (motors shut down and locked), MANUAL (system under RC control), GUIDED (system with autonomous position control, position setpoint controlled manually) or AUTO (system guided by path/waypoint planner). The NAV_MODE defined the current flight state: LIFTOFF (often an open-loop maneuver), LANDING, WAYPOINTS or VECTOR. This represents the internal navigation state machine. The system status shows wether the system is currently active or not and if an emergency occured. During the CRITICAL and EMERGENCY states the MAV is still considered to be active, but should start emergency procedures autonomously. After a failure occured it should first move from active to critical to allow manual intervention and then move to emergency after a certain timeout.
 */
@interface MVMessageSysStatus : MVMessage

- (id)initWithSystemId:(uint8_t)systemId componentId:(uint8_t)componentId onboardControlSensorsPresent:(uint32_t)onboardControlSensorsPresent onboardControlSensorsEnabled:(uint32_t)onboardControlSensorsEnabled onboardControlSensorsHealth:(uint32_t)onboardControlSensorsHealth load:(uint16_t)load voltageBattery:(uint16_t)voltageBattery currentBattery:(int16_t)currentBattery batteryRemaining:(int8_t)batteryRemaining dropRateComm:(uint16_t)dropRateComm errorsComm:(uint16_t)errorsComm errorsCount1:(uint16_t)errorsCount1 errorsCount2:(uint16_t)errorsCount2 errorsCount3:(uint16_t)errorsCount3 errorsCount4:(uint16_t)errorsCount4;

//! Bitmask showing which onboard controllers and sensors are present. Value of 0: not present. Value of 1: present. Indices defined by ENUM MAV_SYS_STATUS_SENSOR
- (uint32_t)onboardControlSensorsPresent;

//! Bitmask showing which onboard controllers and sensors are enabled:  Value of 0: not enabled. Value of 1: enabled. Indices defined by ENUM MAV_SYS_STATUS_SENSOR
- (uint32_t)onboardControlSensorsEnabled;

//! Bitmask showing which onboard controllers and sensors are operational or have an error:  Value of 0: not enabled. Value of 1: enabled. Indices defined by ENUM MAV_SYS_STATUS_SENSOR
- (uint32_t)onboardControlSensorsHealth;

//! Maximum usage in percent of the mainloop time, (0%: 0, 100%: 1000) should be always below 1000
- (uint16_t)load;

//! Battery voltage, in millivolts (1 = 1 millivolt)
- (uint16_t)voltageBattery;

//! Battery current, in 10*milliamperes (1 = 10 milliampere), -1: autopilot does not measure the current
- (int16_t)currentBattery;

//! Remaining battery energy: (0%: 0, 100%: 100), -1: autopilot estimate the remaining battery
- (int8_t)batteryRemaining;

//! Communication drops in percent, (0%: 0, 100%: 10'000), (UART, I2C, SPI, CAN), dropped packets on all links (packets that were corrupted on reception on the MAV)
- (uint16_t)dropRateComm;

//! Communication errors (UART, I2C, SPI, CAN), dropped packets on all links (packets that were corrupted on reception on the MAV)
- (uint16_t)errorsComm;

//! Autopilot-specific errors
- (uint16_t)errorsCount1;

//! Autopilot-specific errors
- (uint16_t)errorsCount2;

//! Autopilot-specific errors
- (uint16_t)errorsCount3;

//! Autopilot-specific errors
- (uint16_t)errorsCount4;

@end
