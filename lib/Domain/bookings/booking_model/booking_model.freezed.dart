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

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'service') ServiceModel get service;@JsonKey(name: 'customer_email') String get customerEmail;@JsonKey(name: 'datetime') String get dateTime;@JsonKey(name: 'work_status') String get status;@JsonKey(name: 'assignedStaff') List<UserModel>? get assignedStaff;@JsonKey(name: 'razorpay_order_id') String? get razorpayOrderId;@JsonKey(name: 'payment_status') String? get paymentStatus;@JsonKey(name: 'total_amount') num? get totalAmount;@JsonKey(name: 'admin_commission') num? get adminCommission;@JsonKey(name: 'owner_payout') num? get ownerPayout;
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingModelCopyWith<BookingModel> get copyWith => _$BookingModelCopyWithImpl<BookingModel>(this as BookingModel, _$identity);

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.service, service) || other.service == service)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.assignedStaff, assignedStaff)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.adminCommission, adminCommission) || other.adminCommission == adminCommission)&&(identical(other.ownerPayout, ownerPayout) || other.ownerPayout == ownerPayout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,service,customerEmail,dateTime,status,const DeepCollectionEquality().hash(assignedStaff),razorpayOrderId,paymentStatus,totalAmount,adminCommission,ownerPayout);

@override
String toString() {
  return 'BookingModel(id: $id, service: $service, customerEmail: $customerEmail, dateTime: $dateTime, status: $status, assignedStaff: $assignedStaff, razorpayOrderId: $razorpayOrderId, paymentStatus: $paymentStatus, totalAmount: $totalAmount, adminCommission: $adminCommission, ownerPayout: $ownerPayout)';
}


}

/// @nodoc
abstract mixin class $BookingModelCopyWith<$Res>  {
  factory $BookingModelCopyWith(BookingModel value, $Res Function(BookingModel) _then) = _$BookingModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'service') ServiceModel service,@JsonKey(name: 'customer_email') String customerEmail,@JsonKey(name: 'datetime') String dateTime,@JsonKey(name: 'work_status') String status,@JsonKey(name: 'assignedStaff') List<UserModel>? assignedStaff,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,@JsonKey(name: 'payment_status') String? paymentStatus,@JsonKey(name: 'total_amount') num? totalAmount,@JsonKey(name: 'admin_commission') num? adminCommission,@JsonKey(name: 'owner_payout') num? ownerPayout
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? service = null,Object? customerEmail = null,Object? dateTime = null,Object? status = null,Object? assignedStaff = freezed,Object? razorpayOrderId = freezed,Object? paymentStatus = freezed,Object? totalAmount = freezed,Object? adminCommission = freezed,Object? ownerPayout = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as ServiceModel,customerEmail: null == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,assignedStaff: freezed == assignedStaff ? _self.assignedStaff : assignedStaff // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num?,adminCommission: freezed == adminCommission ? _self.adminCommission : adminCommission // ignore: cast_nullable_to_non_nullable
as num?,ownerPayout: freezed == ownerPayout ? _self.ownerPayout : ownerPayout // ignore: cast_nullable_to_non_nullable
as num?,
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
  const _BookingModel({@JsonKey(name: '_id') this.id, @JsonKey(name: 'service') required this.service, @JsonKey(name: 'customer_email') required this.customerEmail, @JsonKey(name: 'datetime') required this.dateTime, @JsonKey(name: 'work_status') required this.status, @JsonKey(name: 'assignedStaff') final  List<UserModel>? assignedStaff, @JsonKey(name: 'razorpay_order_id') this.razorpayOrderId, @JsonKey(name: 'payment_status') this.paymentStatus, @JsonKey(name: 'total_amount') this.totalAmount, @JsonKey(name: 'admin_commission') this.adminCommission, @JsonKey(name: 'owner_payout') this.ownerPayout}): _assignedStaff = assignedStaff;
  factory _BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'service') final  ServiceModel service;
@override@JsonKey(name: 'customer_email') final  String customerEmail;
@override@JsonKey(name: 'datetime') final  String dateTime;
@override@JsonKey(name: 'work_status') final  String status;
 final  List<UserModel>? _assignedStaff;
@override@JsonKey(name: 'assignedStaff') List<UserModel>? get assignedStaff {
  final value = _assignedStaff;
  if (value == null) return null;
  if (_assignedStaff is EqualUnmodifiableListView) return _assignedStaff;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'razorpay_order_id') final  String? razorpayOrderId;
@override@JsonKey(name: 'payment_status') final  String? paymentStatus;
@override@JsonKey(name: 'total_amount') final  num? totalAmount;
@override@JsonKey(name: 'admin_commission') final  num? adminCommission;
@override@JsonKey(name: 'owner_payout') final  num? ownerPayout;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.service, service) || other.service == service)&&(identical(other.customerEmail, customerEmail) || other.customerEmail == customerEmail)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._assignedStaff, _assignedStaff)&&(identical(other.razorpayOrderId, razorpayOrderId) || other.razorpayOrderId == razorpayOrderId)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.adminCommission, adminCommission) || other.adminCommission == adminCommission)&&(identical(other.ownerPayout, ownerPayout) || other.ownerPayout == ownerPayout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,service,customerEmail,dateTime,status,const DeepCollectionEquality().hash(_assignedStaff),razorpayOrderId,paymentStatus,totalAmount,adminCommission,ownerPayout);

@override
String toString() {
  return 'BookingModel(id: $id, service: $service, customerEmail: $customerEmail, dateTime: $dateTime, status: $status, assignedStaff: $assignedStaff, razorpayOrderId: $razorpayOrderId, paymentStatus: $paymentStatus, totalAmount: $totalAmount, adminCommission: $adminCommission, ownerPayout: $ownerPayout)';
}


}

/// @nodoc
abstract mixin class _$BookingModelCopyWith<$Res> implements $BookingModelCopyWith<$Res> {
  factory _$BookingModelCopyWith(_BookingModel value, $Res Function(_BookingModel) _then) = __$BookingModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'service') ServiceModel service,@JsonKey(name: 'customer_email') String customerEmail,@JsonKey(name: 'datetime') String dateTime,@JsonKey(name: 'work_status') String status,@JsonKey(name: 'assignedStaff') List<UserModel>? assignedStaff,@JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,@JsonKey(name: 'payment_status') String? paymentStatus,@JsonKey(name: 'total_amount') num? totalAmount,@JsonKey(name: 'admin_commission') num? adminCommission,@JsonKey(name: 'owner_payout') num? ownerPayout
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? service = null,Object? customerEmail = null,Object? dateTime = null,Object? status = null,Object? assignedStaff = freezed,Object? razorpayOrderId = freezed,Object? paymentStatus = freezed,Object? totalAmount = freezed,Object? adminCommission = freezed,Object? ownerPayout = freezed,}) {
  return _then(_BookingModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,service: null == service ? _self.service : service // ignore: cast_nullable_to_non_nullable
as ServiceModel,customerEmail: null == customerEmail ? _self.customerEmail : customerEmail // ignore: cast_nullable_to_non_nullable
as String,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,assignedStaff: freezed == assignedStaff ? _self._assignedStaff : assignedStaff // ignore: cast_nullable_to_non_nullable
as List<UserModel>?,razorpayOrderId: freezed == razorpayOrderId ? _self.razorpayOrderId : razorpayOrderId // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num?,adminCommission: freezed == adminCommission ? _self.adminCommission : adminCommission // ignore: cast_nullable_to_non_nullable
as num?,ownerPayout: freezed == ownerPayout ? _self.ownerPayout : ownerPayout // ignore: cast_nullable_to_non_nullable
as num?,
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
