// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loggedin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoggedinState {

 bool get value; bool get isOnboarded; int? get role;
/// Create a copy of LoggedinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggedinStateCopyWith<LoggedinState> get copyWith => _$LoggedinStateCopyWithImpl<LoggedinState>(this as LoggedinState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedinState&&(identical(other.value, value) || other.value == value)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,value,isOnboarded,role);

@override
String toString() {
  return 'LoggedinState(value: $value, isOnboarded: $isOnboarded, role: $role)';
}


}

/// @nodoc
abstract mixin class $LoggedinStateCopyWith<$Res>  {
  factory $LoggedinStateCopyWith(LoggedinState value, $Res Function(LoggedinState) _then) = _$LoggedinStateCopyWithImpl;
@useResult
$Res call({
 bool value, bool isOnboarded, int? role
});




}
/// @nodoc
class _$LoggedinStateCopyWithImpl<$Res>
    implements $LoggedinStateCopyWith<$Res> {
  _$LoggedinStateCopyWithImpl(this._self, this._then);

  final LoggedinState _self;
  final $Res Function(LoggedinState) _then;

/// Create a copy of LoggedinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? isOnboarded = null,Object? role = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc


class _Initial implements LoggedinState {
  const _Initial({required this.value, required this.isOnboarded, this.role});
  

@override final  bool value;
@override final  bool isOnboarded;
@override final  int? role;

/// Create a copy of LoggedinState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.value, value) || other.value == value)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,value,isOnboarded,role);

@override
String toString() {
  return 'LoggedinState(value: $value, isOnboarded: $isOnboarded, role: $role)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $LoggedinStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 bool value, bool isOnboarded, int? role
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of LoggedinState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? isOnboarded = null,Object? role = freezed,}) {
  return _then(_Initial(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
