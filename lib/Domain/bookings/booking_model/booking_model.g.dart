// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingModel _$BookingModelFromJson(Map<String, dynamic> json) =>
    _BookingModel(
      id: json['id'] as String?,
      service: ServiceModel.fromJson(json['service'] as Map<String, dynamic>),
      customerEmail: json['customer_email'] as String,
      dateTime: json['datetime'] as String,
      status: json['status'] as String,
      razorpayOrderId: json['razorpay_order_id'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(_BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'customer_email': instance.customerEmail,
      'datetime': instance.dateTime,
      'status': instance.status,
      'razorpay_order_id': instance.razorpayOrderId,
    };
