// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  email: json['email'] as String,
  role: (json['role'] as num).toInt(),
  name: json['name'] as String?,
  companyName: json['companyName'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'role': instance.role,
      'name': instance.name,
      'companyName': instance.companyName,
    };
