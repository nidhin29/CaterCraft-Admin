import 'package:bloc/bloc.dart';
import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:catering/Domain/bookings/booking_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:injectable/injectable.dart';
part 'booking_state.dart';
part 'booking_cubit.freezed.dart';

@injectable
class BookingCubit extends Cubit<BookingState> {
  final BookingService _bookingService;
  BookingCubit(this._bookingService) : super(BookingState.initial());

  getBookings() async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final response = await _bookingService.getBookings();
    response.fold(
      (l) => emit(
        state.copyWith(isLoading: false, isFailureOrSuccess: some(left(l))),
      ),
      (r) => emit(
        state.copyWith(isLoading: false, isFailureOrSuccess: some(right(r))),
      ),
    );
  }

 
}
