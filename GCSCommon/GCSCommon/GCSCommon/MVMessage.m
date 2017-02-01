//
//  MVMessage.m
//  MAVLink communications protocol built from common.xml
//
//  Created by mavgen_objc.py
//  http://qgroundcontrol.org/mavlink
//

#import "MVMessage.h"
#import "MVCommonMessages.h"

@implementation MVMessage

@synthesize message=_message;

+ (id)messageWithCMessage:(mavlink_message_t)message {
  static NSDictionary *messageIdToClass = nil;
  if (!messageIdToClass) {
    messageIdToClass = @{
      @0 : [MVMessageHeartbeat class],
      @1 : [MVMessageSysStatus class],
      @2 : [MVMessageSystemTime class],
      @4 : [MVMessagePing class],
      @5 : [MVMessageChangeOperatorControl class],
      @6 : [MVMessageChangeOperatorControlAck class],
      @7 : [MVMessageAuthKey class],
      @11 : [MVMessageSetMode class],
      @20 : [MVMessageParamRequestRead class],
      @21 : [MVMessageParamRequestList class],
      @22 : [MVMessageParamValue class],
      @23 : [MVMessageParamSet class],
      @24 : [MVMessageGpsRawInt class],
      @25 : [MVMessageGpsStatus class],
      @26 : [MVMessageScaledImu class],
      @27 : [MVMessageRawImu class],
      @28 : [MVMessageRawPressure class],
      @29 : [MVMessageScaledPressure class],
      @30 : [MVMessageAttitude class],
      @31 : [MVMessageAttitudeQuaternion class],
      @32 : [MVMessageLocalPositionNed class],
      @33 : [MVMessageGlobalPositionInt class],
      @34 : [MVMessageRcChannelsScaled class],
      @35 : [MVMessageRcChannelsRaw class],
      @36 : [MVMessageServoOutputRaw class],
      @37 : [MVMessageMissionRequestPartialList class],
      @38 : [MVMessageMissionWritePartialList class],
      @39 : [MVMessageMissionItem class],
      @40 : [MVMessageMissionRequest class],
      @41 : [MVMessageMissionSetCurrent class],
      @42 : [MVMessageMissionCurrent class],
      @43 : [MVMessageMissionRequestList class],
      @44 : [MVMessageMissionCount class],
      @45 : [MVMessageMissionClearAll class],
      @46 : [MVMessageMissionItemReached class],
      @47 : [MVMessageMissionAck class],
      @48 : [MVMessageSetGpsGlobalOrigin class],
      @49 : [MVMessageGpsGlobalOrigin class],
      @50 : [MVMessageParamMapRc class],
      @51 : [MVMessageMissionRequestInt class],
      @54 : [MVMessageSafetySetAllowedArea class],
      @55 : [MVMessageSafetyAllowedArea class],
      @61 : [MVMessageAttitudeQuaternionCov class],
      @62 : [MVMessageNavControllerOutput class],
      @63 : [MVMessageGlobalPositionIntCov class],
      @64 : [MVMessageLocalPositionNedCov class],
      @65 : [MVMessageRcChannels class],
      @66 : [MVMessageRequestDataStream class],
      @67 : [MVMessageDataStream class],
      @69 : [MVMessageManualControl class],
      @70 : [MVMessageRcChannelsOverride class],
      @73 : [MVMessageMissionItemInt class],
      @74 : [MVMessageVfrHud class],
      @75 : [MVMessageCommandInt class],
      @76 : [MVMessageCommandLong class],
      @77 : [MVMessageCommandAck class],
      @81 : [MVMessageManualSetpoint class],
      @82 : [MVMessageSetAttitudeTarget class],
      @83 : [MVMessageAttitudeTarget class],
      @84 : [MVMessageSetPositionTargetLocalNed class],
      @85 : [MVMessagePositionTargetLocalNed class],
      @86 : [MVMessageSetPositionTargetGlobalInt class],
      @87 : [MVMessagePositionTargetGlobalInt class],
      @89 : [MVMessageLocalPositionNedSystemGlobalOffset class],
      @90 : [MVMessageHilState class],
      @91 : [MVMessageHilControls class],
      @92 : [MVMessageHilRcInputsRaw class],
      @93 : [MVMessageHilActuatorControls class],
      @100 : [MVMessageOpticalFlow class],
      @101 : [MVMessageGlobalVisionPositionEstimate class],
      @102 : [MVMessageVisionPositionEstimate class],
      @103 : [MVMessageVisionSpeedEstimate class],
      @104 : [MVMessageViconPositionEstimate class],
      @105 : [MVMessageHighresImu class],
      @106 : [MVMessageOpticalFlowRad class],
      @107 : [MVMessageHilSensor class],
      @108 : [MVMessageSimState class],
      @109 : [MVMessageRadioStatus class],
      @110 : [MVMessageFileTransferProtocol class],
      @111 : [MVMessageTimesync class],
      @112 : [MVMessageCameraTrigger class],
      @113 : [MVMessageHilGps class],
      @114 : [MVMessageHilOpticalFlow class],
      @115 : [MVMessageHilStateQuaternion class],
      @116 : [MVMessageScaledImu2 class],
      @117 : [MVMessageLogRequestList class],
      @118 : [MVMessageLogEntry class],
      @119 : [MVMessageLogRequestData class],
      @120 : [MVMessageLogData class],
      @121 : [MVMessageLogErase class],
      @122 : [MVMessageLogRequestEnd class],
      @123 : [MVMessageGpsInjectData class],
      @124 : [MVMessageGps2Raw class],
      @125 : [MVMessagePowerStatus class],
      @126 : [MVMessageSerialControl class],
      @127 : [MVMessageGpsRtk class],
      @128 : [MVMessageGps2Rtk class],
      @129 : [MVMessageScaledImu3 class],
      @130 : [MVMessageDataTransmissionHandshake class],
      @131 : [MVMessageEncapsulatedData class],
      @132 : [MVMessageDistanceSensor class],
      @133 : [MVMessageTerrainRequest class],
      @134 : [MVMessageTerrainData class],
      @135 : [MVMessageTerrainCheck class],
      @136 : [MVMessageTerrainReport class],
      @137 : [MVMessageScaledPressure2 class],
      @138 : [MVMessageAttPosMocap class],
      @139 : [MVMessageSetActuatorControlTarget class],
      @140 : [MVMessageActuatorControlTarget class],
      @141 : [MVMessageAltitude class],
      @142 : [MVMessageResourceRequest class],
      @143 : [MVMessageScaledPressure3 class],
      @144 : [MVMessageFollowTarget class],
      @146 : [MVMessageControlSystemState class],
      @147 : [MVMessageBatteryStatus class],
      @148 : [MVMessageAutopilotVersion class],
      @149 : [MVMessageLandingTarget class],
      @230 : [MVMessageEstimatorStatus class],
      @231 : [MVMessageWindCov class],
      @232 : [MVMessageGpsInput class],
      @233 : [MVMessageGpsRtcmData class],
      @234 : [MVMessageHighLatency class],
      @241 : [MVMessageVibration class],
      @242 : [MVMessageHomePosition class],
      @243 : [MVMessageSetHomePosition class],
      @244 : [MVMessageMessageInterval class],
      @245 : [MVMessageExtendedSysState class],
      @246 : [MVMessageAdsbVehicle class],
      @247 : [MVMessageCollision class],
      @248 : [MVMessageV2Extension class],
      @249 : [MVMessageMemoryVect class],
      @250 : [MVMessageDebugVect class],
      @251 : [MVMessageNamedValueFloat class],
      @252 : [MVMessageNamedValueInt class],
      @253 : [MVMessageStatustext class],
      @254 : [MVMessageDebug class],
    };
  }

  Class messageClass = messageIdToClass[@(message.msgid)];
  // Store unknown messages to MVMessage
  if (!messageClass) {
    messageClass = [MVMessage class];
  }

  return [[messageClass alloc] initWithCMessage:message];
}

- (id)initWithCMessage:(mavlink_message_t)message {
  if ((self = [super init])) {
    self->_message = message;
  }
  return self;
}

- (NSData *)data {
  uint8_t buffer[MAVLINK_MAX_PACKET_LEN];

  NSInteger length = mavlink_msg_to_send_buffer(buffer, &self->_message);

  return [NSData dataWithBytes:buffer length:length];
}

- (uint8_t)systemId {
  return self->_message.sysid;
}

- (uint8_t)componentId {
  return self->_message.compid;
}

- (uint8_t)messageId {
  return self->_message.msgid;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"%@, systemId=%d, componentId=%d", [self class], self.systemId, self.componentId];
}

@end
