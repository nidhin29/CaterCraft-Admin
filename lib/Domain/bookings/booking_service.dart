import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:dartz/dartz.dart';
import 'package:catering/Domain/Failure/failure.dart';

abstract class BookingService {
  Future<Either<MainFailure, BookingModel>> getBookings();
}
