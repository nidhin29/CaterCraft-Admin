// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['_id'] as String?,
      senderId: json['senderId'] as String,
      senderType: json['senderType'] as String,
      receiverId: json['receiverId'] as String,
      receiverType: json['receiverType'] as String,
      message: json['message'] as String,
      room: json['room'] as String,
      imageUrl: json['imageUrl'] as String?,
      isEveryoneDeleted: json['isEveryoneDeleted'] as bool? ?? false,
      deletedBy:
          (json['deletedBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'senderId': instance.senderId,
      'senderType': instance.senderType,
      'receiverId': instance.receiverId,
      'receiverType': instance.receiverType,
      'message': instance.message,
      'room': instance.room,
      'imageUrl': instance.imageUrl,
      'isEveryoneDeleted': instance.isEveryoneDeleted,
      'deletedBy': instance.deletedBy,
      'createdAt': instance.createdAt,
    };
