// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewState {

 bool get isLoading; Option<Either<MainFailure, TeamModel>> get isFailureOrSuccess; Option<Either<MainFailure, CustomerModel>> get isCustomerFailureOrSuccess; Option<Either<MainFailure, Unit>> get isDeleteOwner;
/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewStateCopyWith<ViewState> get copyWith => _$ViewStateCopyWithImpl<ViewState>(this as ViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailureOrSuccess, isFailureOrSuccess) || other.isFailureOrSuccess == isFailureOrSuccess)&&(identical(other.isCustomerFailureOrSuccess, isCustomerFailureOrSuccess) || other.isCustomerFailureOrSuccess == isCustomerFailureOrSuccess)&&(identical(other.isDeleteOwner, isDeleteOwner) || other.isDeleteOwner == isDeleteOwner));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFailureOrSuccess,isCustomerFailureOrSuccess,isDeleteOwner);

@override
String toString() {
  return 'ViewState(isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess, isCustomerFailureOrSuccess: $isCustomerFailureOrSuccess, isDeleteOwner: $isDeleteOwner)';
}


}

/// @nodoc
abstract mixin class $ViewStateCopyWith<$Res>  {
  factory $ViewStateCopyWith(ViewState value, $Res Function(ViewState) _then) = _$ViewStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Option<Either<MainFailure, TeamModel>> isFailureOrSuccess, Option<Either<MainFailure, CustomerModel>> isCustomerFailureOrSuccess, Option<Either<MainFailure, Unit>> isDeleteOwner
});




}
/// @nodoc
class _$ViewStateCopyWithImpl<$Res>
    implements $ViewStateCopyWith<$Res> {
  _$ViewStateCopyWithImpl(this._self, this._then);

  final ViewState _self;
  final $Res Function(ViewState) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isFailureOrSuccess = null,Object? isCustomerFailureOrSuccess = null,Object? isDeleteOwner = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailureOrSuccess: null == isFailureOrSuccess ? _self.isFailureOrSuccess : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, TeamModel>>,isCustomerFailureOrSuccess: null == isCustomerFailureOrSuccess ? _self.isCustomerFailureOrSuccess : isCustomerFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, CustomerModel>>,isDeleteOwner: null == isDeleteOwner ? _self.isDeleteOwner : isDeleteOwner // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, Unit>>,
  ));
}

}


/// @nodoc


class _Initial implements ViewState {
  const _Initial({required this.isLoading, required this.isFailureOrSuccess, required this.isCustomerFailureOrSuccess, required this.isDeleteOwner});
  

@override final  bool isLoading;
@override final  Option<Either<MainFailure, TeamModel>> isFailureOrSuccess;
@override final  Option<Either<MainFailure, CustomerModel>> isCustomerFailureOrSuccess;
@override final  Option<Either<MainFailure, Unit>> isDeleteOwner;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailureOrSuccess, isFailureOrSuccess) || other.isFailureOrSuccess == isFailureOrSuccess)&&(identical(other.isCustomerFailureOrSuccess, isCustomerFailureOrSuccess) || other.isCustomerFailureOrSuccess == isCustomerFailureOrSuccess)&&(identical(other.isDeleteOwner, isDeleteOwner) || other.isDeleteOwner == isDeleteOwner));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFailureOrSuccess,isCustomerFailureOrSuccess,isDeleteOwner);

@override
String toString() {
  return 'ViewState(isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess, isCustomerFailureOrSuccess: $isCustomerFailureOrSuccess, isDeleteOwner: $isDeleteOwner)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $ViewStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Option<Either<MainFailure, TeamModel>> isFailureOrSuccess, Option<Either<MainFailure, CustomerModel>> isCustomerFailureOrSuccess, Option<Either<MainFailure, Unit>> isDeleteOwner
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isFailureOrSuccess = null,Object? isCustomerFailureOrSuccess = null,Object? isDeleteOwner = null,}) {
  return _then(_Initial(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailureOrSuccess: null == isFailureOrSuccess ? _self.isFailureOrSuccess : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, TeamModel>>,isCustomerFailureOrSuccess: null == isCustomerFailureOrSuccess ? _self.isCustomerFailureOrSuccess : isCustomerFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, CustomerModel>>,isDeleteOwner: null == isDeleteOwner ? _self.isDeleteOwner : isDeleteOwner // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, Unit>>,
  ));
}


}

// dart format on
