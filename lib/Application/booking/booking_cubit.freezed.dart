// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingState {

 bool get isLoading; Option<Either<MainFailure, BookingModel>> get isFailureOrSuccess;
/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingStateCopyWith<BookingState> get copyWith => _$BookingStateCopyWithImpl<BookingState>(this as BookingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailureOrSuccess, isFailureOrSuccess) || other.isFailureOrSuccess == isFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFailureOrSuccess);

@override
String toString() {
  return 'BookingState(isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class $BookingStateCopyWith<$Res>  {
  factory $BookingStateCopyWith(BookingState value, $Res Function(BookingState) _then) = _$BookingStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Option<Either<MainFailure, BookingModel>> isFailureOrSuccess
});




}
/// @nodoc
class _$BookingStateCopyWithImpl<$Res>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._self, this._then);

  final BookingState _self;
  final $Res Function(BookingState) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isFailureOrSuccess = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailureOrSuccess: null == isFailureOrSuccess ? _self.isFailureOrSuccess : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, BookingModel>>,
  ));
}

}


/// @nodoc


class _Initial implements BookingState {
  const _Initial({required this.isLoading, required this.isFailureOrSuccess});
  

@override final  bool isLoading;
@override final  Option<Either<MainFailure, BookingModel>> isFailureOrSuccess;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitialCopyWith<_Initial> get copyWith => __$InitialCopyWithImpl<_Initial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFailureOrSuccess, isFailureOrSuccess) || other.isFailureOrSuccess == isFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFailureOrSuccess);

@override
String toString() {
  return 'BookingState(isLoading: $isLoading, isFailureOrSuccess: $isFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) = __$InitialCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Option<Either<MainFailure, BookingModel>> isFailureOrSuccess
});




}
/// @nodoc
class __$InitialCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isFailureOrSuccess = null,}) {
  return _then(_Initial(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFailureOrSuccess: null == isFailureOrSuccess ? _self.isFailureOrSuccess : isFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, BookingModel>>,
  ));
}


}

// dart format on
