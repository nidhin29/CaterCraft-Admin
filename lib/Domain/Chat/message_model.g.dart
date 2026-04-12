// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['_id'] as String?,
      sender: json['sender'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
      roomId: json['roomId'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sender': instance.sender,
      'message': instance.message,
      'timestamp': instance.timestamp,
      'roomId': instance.roomId,
    };
