// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingModel _$BookingModelFromJson(Map<String, dynamic> json) =>
    _BookingModel(
      id: json['_id'] as String?,
      service: ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      customerEmail: json['customer_email'] as String,
      dateTime: json['datetime'] as String,
      status: json['work_status'] as String,
      assignedStaff:
          (json['assignedStaff'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      razorpayOrderId: json['razorpay_order_id'] as String?,
      paymentStatus: json['payment_status'] as String?,
      totalAmount: json['total_amount'] as num?,
      adminCommission: json['admin_commission'] as num?,
      ownerPayout: json['owner_payout'] as num?,
    );

Map<String, dynamic> _$BookingModelToJson(_BookingModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'service': instance.service,
      'customer_email': instance.customerEmail,
      'datetime': instance.dateTime,
      'work_status': instance.status,
      'assignedStaff': instance.assignedStaff,
      'razorpay_order_id': instance.razorpayOrderId,
      'payment_status': instance.paymentStatus,
      'total_amount': instance.totalAmount,
      'admin_commission': instance.adminCommission,
      'owner_payout': instance.ownerPayout,
    };
