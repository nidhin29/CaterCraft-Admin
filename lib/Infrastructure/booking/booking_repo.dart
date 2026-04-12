import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:catering/Domain/bookings/booking_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingService)
class BookingRepo implements BookingService {
  final Dio _dio;
  BookingRepo(this._dio);

  @override
  Future<Either<MainFailure, List<BookingModel>>> getBookings() async {
    try {
      final response = await _dio.get('api/v1/booking/User/view-bookings');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        final bookings = data.map((json) => BookingModel.fromJson(json as Map<String, dynamic>)).toList();
        return Right(bookings);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }
}
