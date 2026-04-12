import 'package:catering/Domain/Service/service_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'service') required ServiceModel service,
    @JsonKey(name: 'customer_email') required String customerEmail,
    @JsonKey(name: 'datetime') required String dateTime,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}
