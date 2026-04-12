// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'service') ServiceModel get service;@JsonKey(name: 'customer_email') String get customerEmail;@JsonKey(name: 'datetime') String get dateTime;@JsonKey(name: 'status') String get status;@JsonKey(name: 'razorpay_order_id') String? get razorpayOrderId;
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingModelCopyWith<BookingModel> get copyWith => _$BookingModelCopyWithImpl<BookingModel>(this as BookingModel, _$identity);

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.service, service) || other.service == service)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,service,customerEmail,dateTime,status,razorpayOrderId);

@override
String toString() {
  return 'BookingModel(id: $id, service: $service, customerEmail: $customerEmail, dateTime: $dateTime, status: $status, razorpayOrderId: $razorpayOrderId)';
}


}

/// @nodoc
abstract mixin class $BookingModelCopyWith<$Res>  {
  factory $BookingModelCopyWith(BookingModel value, $Res Function(BookingModel) _then) = _$BookingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'service') ServiceModel service,@JsonKey(name: 'customer_email') String customerEmail,@JsonKey(name: 'datetime') String dateTime,@JsonKey(name: 'status') String status,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId
});


$ServiceModelCopyWith<$Res> get service;

}
/// @nodoc
class _$BookingModelCopyWithImpl<$Res>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._self, this._then);

  final BookingModel _self;
  final $Res Function(BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? service = null,Object? customerEmail = null,Object? dateTime = null,Object? status = null,Object? razorpayOrderId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as ServiceModel,customerEmail: null == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceModelCopyWith<$Res> get service {
  
  return $ServiceModelCopyWith<$Res>(_self.service, (value) {
    return _then(_self.copyWith(service: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _BookingModel implements BookingModel {
  const _BookingModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'service') required this.service, @JsonKey(name: 'customer_email') required this.customerEmail, @JsonKey(name: 'datetime') required this.dateTime, @JsonKey(name: 'status') required this.status, @JsonKey(name: 'razorpay_order_id') this.razorpayOrderId});
  factory _BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'service') final  ServiceModel service;
@override@JsonKey(name: 'customer_email') final  String customerEmail;
@override@JsonKey(name: 'datetime') final  String dateTime;
@override@JsonKey(name: 'status') final  String status;
@override@JsonKey(name: 'razorpay_order_id') final  String? razorpayOrderId;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingModelCopyWith<_BookingModel> get copyWith => __$BookingModelCopyWithImpl<_BookingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.service, service) || other.service == service)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,service,customerEmail,dateTime,status,razorpayOrderId);

@override
String toString() {
  return 'BookingModel(id: $id, service: $service, customerEmail: $customerEmail, dateTime: $dateTime, status: $status, razorpayOrderId: $razorpayOrderId)';
}


}

/// @nodoc
abstract mixin class _$BookingModelCopyWith<$Res> implements $BookingModelCopyWith<$Res> {
  factory _$BookingModelCopyWith(_BookingModel value, $Res Function(_BookingModel) _then) = __$BookingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'service') ServiceModel service,@JsonKey(name: 'customer_email') String customerEmail,@JsonKey(name: 'datetime') String dateTime,@JsonKey(name: 'status') String status,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId
});


@override $ServiceModelCopyWith<$Res> get service;

}
/// @nodoc
class __$BookingModelCopyWithImpl<$Res>
    implements _$BookingModelCopyWith<$Res> {
  __$BookingModelCopyWithImpl(this._self, this._then);

  final _BookingModel _self;
  final $Res Function(_BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? service = null,Object? customerEmail = null,Object? dateTime = null,Object? status = null,Object? razorpayOrderId = freezed,}) {
  return _then(_BookingModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as ServiceModel,customerEmail: null == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceModelCopyWith<$Res> get service {
  
  return $ServiceModelCopyWith<$Res>(_self.service, (value) {
    return _then(_self.copyWith(service: value));
  });
}
}

// dart format on
