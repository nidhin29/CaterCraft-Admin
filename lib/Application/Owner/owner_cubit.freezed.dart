// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OwnerState {

 List<BookingModel> get bookings; List<ServiceModel> get services; List<UserModel> get staffList; bool get isLoading; bool get isSubmitting; Option<Either<MainFailure, List<BookingModel>>> get bookingFailureOrSuccess; Option<Either<MainFailure, Unit>> get serviceFailureOrSuccess;
/// Create a copy of OwnerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerStateCopyWith<OwnerState> get copyWith => _$OwnerStateCopyWithImpl<OwnerState>(this as OwnerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerState&&const DeepCollectionEquality().equals(other.bookings, bookings)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.staffList, staffList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.bookingFailureOrSuccess, bookingFailureOrSuccess) || other.bookingFailureOrSuccess == bookingFailureOrSuccess)&&(identical(other.serviceFailureOrSuccess, serviceFailureOrSuccess) || other.serviceFailureOrSuccess == serviceFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bookings),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(staffList),isLoading,isSubmitting,bookingFailureOrSuccess,serviceFailureOrSuccess);

@override
String toString() {
  return 'OwnerState(bookings: $bookings, services: $services, staffList: $staffList, isLoading: $isLoading, isSubmitting: $isSubmitting, bookingFailureOrSuccess: $bookingFailureOrSuccess, serviceFailureOrSuccess: $serviceFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class $OwnerStateCopyWith<$Res>  {
  factory $OwnerStateCopyWith(OwnerState value, $Res Function(OwnerState) _then) = _$OwnerStateCopyWithImpl;
@useResult
$Res call({
 List<BookingModel> bookings, List<ServiceModel> services, List<UserModel> staffList, bool isLoading, bool isSubmitting, Option<Either<MainFailure, List<BookingModel>>> bookingFailureOrSuccess, Option<Either<MainFailure, Unit>> serviceFailureOrSuccess
});




}
/// @nodoc
class _$OwnerStateCopyWithImpl<$Res>
    implements $OwnerStateCopyWith<$Res> {
  _$OwnerStateCopyWithImpl(this._self, this._then);

  final OwnerState _self;
  final $Res Function(OwnerState) _then;

/// Create a copy of OwnerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookings = null,Object? services = null,Object? staffList = null,Object? isLoading = null,Object? isSubmitting = null,Object? bookingFailureOrSuccess = null,Object? serviceFailureOrSuccess = null,}) {
  return _then(_self.copyWith(
bookings: null == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<BookingModel>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceModel>,staffList: null == staffList ? _self.staffList : staffList // ignore: cast_nullable_to_non_nullable
as List<UserModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,bookingFailureOrSuccess: null == bookingFailureOrSuccess ? _self.bookingFailureOrSuccess : bookingFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, List<BookingModel>>>,serviceFailureOrSuccess: null == serviceFailureOrSuccess ? _self.serviceFailureOrSuccess : serviceFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, Unit>>,
  ));
}

}


/// @nodoc


class _OwnerState implements OwnerState {
  const _OwnerState({required final  List<BookingModel> bookings, required final  List<ServiceModel> services, required final  List<UserModel> staffList, required this.isLoading, required this.isSubmitting, required this.bookingFailureOrSuccess, required this.serviceFailureOrSuccess}): _bookings = bookings,_services = services,_staffList = staffList;
  

 final  List<BookingModel> _bookings;
@override List<BookingModel> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}

 final  List<ServiceModel> _services;
@override List<ServiceModel> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<UserModel> _staffList;
@override List<UserModel> get staffList {
  if (_staffList is EqualUnmodifiableListView) return _staffList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staffList);
}

@override final  bool isLoading;
@override final  bool isSubmitting;
@override final  Option<Either<MainFailure, List<BookingModel>>> bookingFailureOrSuccess;
@override final  Option<Either<MainFailure, Unit>> serviceFailureOrSuccess;

/// Create a copy of OwnerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerStateCopyWith<_OwnerState> get copyWith => __$OwnerStateCopyWithImpl<_OwnerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerState&&const DeepCollectionEquality().equals(other._bookings, _bookings)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._staffList, _staffList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.bookingFailureOrSuccess, bookingFailureOrSuccess) || other.bookingFailureOrSuccess == bookingFailureOrSuccess)&&(identical(other.serviceFailureOrSuccess, serviceFailureOrSuccess) || other.serviceFailureOrSuccess == serviceFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bookings),const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_staffList),isLoading,isSubmitting,bookingFailureOrSuccess,serviceFailureOrSuccess);

@override
String toString() {
  return 'OwnerState(bookings: $bookings, services: $services, staffList: $staffList, isLoading: $isLoading, isSubmitting: $isSubmitting, bookingFailureOrSuccess: $bookingFailureOrSuccess, serviceFailureOrSuccess: $serviceFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class _$OwnerStateCopyWith<$Res> implements $OwnerStateCopyWith<$Res> {
  factory _$OwnerStateCopyWith(_OwnerState value, $Res Function(_OwnerState) _then) = __$OwnerStateCopyWithImpl;
@override @useResult
$Res call({
 List<BookingModel> bookings, List<ServiceModel> services, List<UserModel> staffList, bool isLoading, bool isSubmitting, Option<Either<MainFailure, List<BookingModel>>> bookingFailureOrSuccess, Option<Either<MainFailure, Unit>> serviceFailureOrSuccess
});




}
/// @nodoc
class __$OwnerStateCopyWithImpl<$Res>
    implements _$OwnerStateCopyWith<$Res> {
  __$OwnerStateCopyWithImpl(this._self, this._then);

  final _OwnerState _self;
  final $Res Function(_OwnerState) _then;

/// Create a copy of OwnerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookings = null,Object? services = null,Object? staffList = null,Object? isLoading = null,Object? isSubmitting = null,Object? bookingFailureOrSuccess = null,Object? serviceFailureOrSuccess = null,}) {
  return _then(_OwnerState(
bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<BookingModel>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<ServiceModel>,staffList: null == staffList ? _self._staffList : staffList // ignore: cast_nullable_to_non_nullable
as List<UserModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,bookingFailureOrSuccess: null == bookingFailureOrSuccess ? _self.bookingFailureOrSuccess : bookingFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, List<BookingModel>>>,serviceFailureOrSuccess: null == serviceFailureOrSuccess ? _self.serviceFailureOrSuccess : serviceFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<MainFailure, Unit>>,
  ));
}


}

// dart format on
