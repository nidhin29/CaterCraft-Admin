// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthResponse {

@JsonKey(name: 'accessToken') String? get accessToken;@JsonKey(name: 'refreshToken') String? get refreshToken;@JsonKey(name: 'user') UserModel? get user;
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthResponseCopyWith<AuthResponse> get copyWith => _$AuthResponseCopyWithImpl<AuthResponse>(this as AuthResponse, _$identity);

  /// Serializes this AuthResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthResponseCopyWith<$Res>  {
  factory $AuthResponseCopyWith(AuthResponse value, $Res Function(AuthResponse) _then) = _$AuthResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'accessToken') String? accessToken,@JsonKey(name: 'refreshToken') String? refreshToken,@JsonKey(name: 'user') UserModel? user
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthResponseCopyWithImpl<$Res>
    implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._self, this._then);

  final AuthResponse _self;
  final $Res Function(AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? refreshToken = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}
/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _AuthResponse implements AuthResponse {
  const _AuthResponse({@JsonKey(name: 'accessToken') this.accessToken, @JsonKey(name: 'refreshToken') this.refreshToken, @JsonKey(name: 'user') this.user});
  factory _AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

@override@JsonKey(name: 'accessToken') final  String? accessToken;
@override@JsonKey(name: 'refreshToken') final  String? refreshToken;
@override@JsonKey(name: 'user') final  UserModel? user;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthResponseCopyWith<_AuthResponse> get copyWith => __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthResponse&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,user);

@override
String toString() {
  return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthResponseCopyWith<$Res> implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(_AuthResponse value, $Res Function(_AuthResponse) _then) = __$AuthResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'accessToken') String? accessToken,@JsonKey(name: 'refreshToken') String? refreshToken,@JsonKey(name: 'user') UserModel? user
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(this._self, this._then);

  final _AuthResponse _self;
  final $Res Function(_AuthResponse) _then;

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? refreshToken = freezed,Object? user = freezed,}) {
  return _then(_AuthResponse(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,
  ));
}

/// Create a copy of AuthResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$BaseApiResponse<T> {

@JsonKey(name: 'statusCode') int get statusCode;@JsonKey(name: 'message') String get message;@JsonKey(name: 'success') bool get success;@JsonKey(name: 'data') T? get data;
/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseApiResponseCopyWith<T, BaseApiResponse<T>> get copyWith => _$BaseApiResponseCopyWithImpl<T, BaseApiResponse<T>>(this as BaseApiResponse<T>, _$identity);

  /// Serializes this BaseApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseApiResponse<T>&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BaseApiResponse<$T>(statusCode: $statusCode, message: $message, success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $BaseApiResponseCopyWith<T,$Res>  {
  factory $BaseApiResponseCopyWith(BaseApiResponse<T> value, $Res Function(BaseApiResponse<T>) _then) = _$BaseApiResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'statusCode') int statusCode,@JsonKey(name: 'message') String message,@JsonKey(name: 'success') bool success,@JsonKey(name: 'data') T? data
});




}
/// @nodoc
class _$BaseApiResponseCopyWithImpl<T,$Res>
    implements $BaseApiResponseCopyWith<T, $Res> {
  _$BaseApiResponseCopyWithImpl(this._self, this._then);

  final BaseApiResponse<T> _self;
  final $Res Function(BaseApiResponse<T>) _then;

/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusCode = null,Object? message = null,Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _BaseApiResponse<T> implements BaseApiResponse<T> {
  const _BaseApiResponse({@JsonKey(name: 'statusCode') required this.statusCode, @JsonKey(name: 'message') required this.message, @JsonKey(name: 'success') required this.success, @JsonKey(name: 'data') this.data});
  factory _BaseApiResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$BaseApiResponseFromJson(json,fromJsonT);

@override@JsonKey(name: 'statusCode') final  int statusCode;
@override@JsonKey(name: 'message') final  String message;
@override@JsonKey(name: 'success') final  bool success;
@override@JsonKey(name: 'data') final  T? data;

/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BaseApiResponseCopyWith<T, _BaseApiResponse<T>> get copyWith => __$BaseApiResponseCopyWithImpl<T, _BaseApiResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$BaseApiResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BaseApiResponse<T>&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusCode,message,success,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BaseApiResponse<$T>(statusCode: $statusCode, message: $message, success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BaseApiResponseCopyWith<T,$Res> implements $BaseApiResponseCopyWith<T, $Res> {
  factory _$BaseApiResponseCopyWith(_BaseApiResponse<T> value, $Res Function(_BaseApiResponse<T>) _then) = __$BaseApiResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'statusCode') int statusCode,@JsonKey(name: 'message') String message,@JsonKey(name: 'success') bool success,@JsonKey(name: 'data') T? data
});




}
/// @nodoc
class __$BaseApiResponseCopyWithImpl<T,$Res>
    implements _$BaseApiResponseCopyWith<T, $Res> {
  __$BaseApiResponseCopyWithImpl(this._self, this._then);

  final _BaseApiResponse<T> _self;
  final $Res Function(_BaseApiResponse<T>) _then;

/// Create a copy of BaseApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? message = null,Object? success = null,Object? data = freezed,}) {
  return _then(_BaseApiResponse<T>(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
