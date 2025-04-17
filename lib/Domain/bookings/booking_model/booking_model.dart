import 'booking.dart';

class BookingModel {
  String? status;
  List<Booking>? bookings;

  BookingModel({this.status, this.bookings});

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    status: json['status'] as String?,
    bookings:
        (json['bookings'] as List<dynamic>?)
            ?.map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'bookings': bookings?.map((e) => e.toJson()).toList(),
  };
}
