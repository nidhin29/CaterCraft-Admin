// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SigninState {

 bool get isLoading; bool get isSendingOtp; bool get isVerifyingOtp; bool get isGoogleRegistrationRequired; String? get googleTokenID; Option<Either<MainFailure, AuthResponse>> get isFailureOrSuccess; Option<Either<MainFailure, Unit>> get otpSendFailureOrSuccess;
/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninStateCopyWith<SigninState> get copyWith => _$SigninStateCopyWithImpl<SigninState>(this as SigninState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSendingOtp, isSendingOtp) || other.isSendingOtp == isSendingOtp)&&(identical(other.isVerifyingOtp, isVerifyingOtp) || other.isVerifyingOtp == isVerifyingOtp)&&(identical(other.isGoogleRegistrationRequired, isGoogleRegistrationRequired) || other.isGoogleRegistrationRequired == isGoogleRegistrationRequired)&&(identical(other.googleTokenID, googleTokenID) || other.googleTokenID == googleTokenID)&&(identical(other.isFailureOrSuccess, isFailureOrSuccess) || other.isFailureOrSuccess == isFailureOrSuccess)&&(identical(other.otpSendFailureOrSuccess, otpSendFailureOrSuccess) || other.otpSendFailureOrSuccess == otpSendFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSendingOtp,isVerifyingOtp,isGoogleRegistrationRequired,googleTokenID,isFailureOrSuccess,otpSendFailureOrSuccess);

@override
String toString() {
  return 'SigninState(isLoading: $isLoading, isSendingOtp: $isSendingOtp, isVerifyingOtp: $isVerifyingOtp, isGoogleRegistrationRequired: $isGoogleRegistrationRequired, googleTokenID: $googleTokenID, isFailureOrSuccess: $isFailureOrSuccess, otpSendFailureOrSuccess: $otpSendFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class $SigninStateCopyWith<$Res>  {
  factory $SigninStateCopyWith(SigninState value, $Res Function(SigninState) _then) = _$SigninStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSendingOtp, bool isVerifyingOtp, bool isGoogleRegistrationRequired, String? googleTokenID, Option<Either<MainFailure, AuthResponse>> isFailureOrSuccess, Option<Either<MainFailure, Unit>> otpSendFailureOrSuccess
});




}
/// @nodoc
class _$SigninStateCopyWithImpl<$Res>
    implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._self, this._then);

  final SigninState _self;
  final $Res Function(SigninState) _then;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSendingOtp = null,Object? isVerifyingOtp = null,Object? isGoogleRegistrationRequired = null,Object? googleTokenID = freezed,Object? isFailureOrSuccess = null,Object? otpSendFailureOrSuccess = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSendingOtp: null == isSendingOtp ? _self.isSendingOtp : isSendingOtp // ignore: cast_nullable_to_non_nullable
as bool,isVerifyingOtp: null == isVerifyingOtp ? _self.isVerifyingOtp : isVerifyingOtp // ignore: cast_nullable_to_non_nullable
as bool,isGoogleRegistrationRequired: null == isGoogleRegistrationRequired ? _self.isGoogleRegistrationRequired : isGoogleRegistrationRequired // ignore: cast_nullable_to_non_nullable
as bool,googleTokenID: freezed == googleTokenID ? _self.googleTokenID : googleTokenID // ignore: cast_nullable_to_non_nullable
as String?,isFailureOrSuccess: null == isFailureOrSuccess ? _self.isFailureOrSuccess : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, AuthResponse>>,otpSendFailureOrSuccess: null == otpSendFailureOrSuccess ? _self.otpSendFailureOrSuccess : otpSendFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, Unit>>,
  ));
}

}


/// @nodoc


class _SigninState implements SigninState {
  const _SigninState({required this.isLoading, required this.isSendingOtp, required this.isVerifyingOtp, required this.isGoogleRegistrationRequired, required this.googleTokenID, required this.isFailureOrSuccess, required this.otpSendFailureOrSuccess});
  

@override final  bool isLoading;
@override final  bool isSendingOtp;
@override final  bool isVerifyingOtp;
@override final  bool isGoogleRegistrationRequired;
@override final  String? googleTokenID;
@override final  Option<Either<MainFailure, AuthResponse>> isFailureOrSuccess;
@override final  Option<Either<MainFailure, Unit>> otpSendFailureOrSuccess;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SigninStateCopyWith<_SigninState> get copyWith => __$SigninStateCopyWithImpl<_SigninState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SigninState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSendingOtp, isSendingOtp) || other.isSendingOtp == isSendingOtp)&&(identical(other.isVerifyingOtp, isVerifyingOtp) || other.isVerifyingOtp == isVerifyingOtp)&&(identical(other.isGoogleRegistrationRequired, isGoogleRegistrationRequired) || other.isGoogleRegistrationRequired == isGoogleRegistrationRequired)&&(identical(other.googleTokenID, googleTokenID) || other.googleTokenID == googleTokenID)&&(identical(other.isFailureOrSuccess, isFailureOrSuccess) || other.isFailureOrSuccess == isFailureOrSuccess)&&(identical(other.otpSendFailureOrSuccess, otpSendFailureOrSuccess) || other.otpSendFailureOrSuccess == otpSendFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSendingOtp,isVerifyingOtp,isGoogleRegistrationRequired,googleTokenID,isFailureOrSuccess,otpSendFailureOrSuccess);

@override
String toString() {
  return 'SigninState(isLoading: $isLoading, isSendingOtp: $isSendingOtp, isVerifyingOtp: $isVerifyingOtp, isGoogleRegistrationRequired: $isGoogleRegistrationRequired, googleTokenID: $googleTokenID, isFailureOrSuccess: $isFailureOrSuccess, otpSendFailureOrSuccess: $otpSendFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class _$SigninStateCopyWith<$Res> implements $SigninStateCopyWith<$Res> {
  factory _$SigninStateCopyWith(_SigninState value, $Res Function(_SigninState) _then) = __$SigninStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSendingOtp, bool isVerifyingOtp, bool isGoogleRegistrationRequired, String? googleTokenID, Option<Either<MainFailure, AuthResponse>> isFailureOrSuccess, Option<Either<MainFailure, Unit>> otpSendFailureOrSuccess
});




}
/// @nodoc
class __$SigninStateCopyWithImpl<$Res>
    implements _$SigninStateCopyWith<$Res> {
  __$SigninStateCopyWithImpl(this._self, this._then);

  final _SigninState _self;
  final $Res Function(_SigninState) _then;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSendingOtp = null,Object? isVerifyingOtp = null,Object? isGoogleRegistrationRequired = null,Object? googleTokenID = freezed,Object? isFailureOrSuccess = null,Object? otpSendFailureOrSuccess = null,}) {
  return _then(_SigninState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSendingOtp: null == isSendingOtp ? _self.isSendingOtp : isSendingOtp // ignore: cast_nullable_to_non_nullable
as bool,isVerifyingOtp: null == isVerifyingOtp ? _self.isVerifyingOtp : isVerifyingOtp // ignore: cast_nullable_to_non_nullable
as bool,isGoogleRegistrationRequired: null == isGoogleRegistrationRequired ? _self.isGoogleRegistrationRequired : isGoogleRegistrationRequired // ignore: cast_nullable_to_non_nullable
as bool,googleTokenID: freezed == googleTokenID ? _self.googleTokenID : googleTokenID // ignore: cast_nullable_to_non_nullable
as String?,isFailureOrSuccess: null == isFailureOrSuccess ? _self.isFailureOrSuccess : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, AuthResponse>>,otpSendFailureOrSuccess: null == otpSendFailureOrSuccess ? _self.otpSendFailureOrSuccess : otpSendFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, Unit>>,
  ));
}


}

// dart format on
