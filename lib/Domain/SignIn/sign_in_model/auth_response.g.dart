// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      user:
          json['user'] == null
              ? null
              : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      owner:
          json['owner'] == null
              ? null
              : UserModel.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'owner': instance.owner,
    };

_BaseApiResponse<T> _$BaseApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _BaseApiResponse<T>(
  statusCode: (json['statusCode'] as num).toInt(),
  message: json['message'] as String,
  success: json['success'] as bool,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$BaseApiResponseToJson<T>(
  _BaseApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'message': instance.message,
  'success': instance.success,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
