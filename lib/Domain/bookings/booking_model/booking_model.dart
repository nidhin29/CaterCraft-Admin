import 'package:catering/Domain/Service/service_model.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'service') required ServiceModel service,
    @JsonKey(name: 'customer_email') required String customerEmail,
    @JsonKey(name: 'datetime') required String dateTime,
    @JsonKey(name: 'work_status') required String status,
    @JsonKey(name: 'assignedStaff') List<UserModel>? assignedStaff,
    @JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'total_amount') num? totalAmount,
    @JsonKey(name: 'admin_commission') num? adminCommission,
    @JsonKey(name: 'owner_payout') num? ownerPayout,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
