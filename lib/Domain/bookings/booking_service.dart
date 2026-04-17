import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:dartz/dartz.dart';
import 'package:catering/Domain/Failure/failure.dart';

abstract class BookingService {
  Future<Either<MainFailure, List<BookingModel>>> getBookings();
  Future<Either<MainFailure, Unit>> assignStaff(String bookingId, List<String> staffIds);
  Future<Either<MainFailure, List<BookingModel>>> getStaffTasks();
  Future<Either<MainFailure, Unit>> updateStatus(String bookingId, String newStatus);
}
