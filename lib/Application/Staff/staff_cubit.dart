import 'package:bloc/bloc.dart';
import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:catering/Domain/bookings/booking_service.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'staff_state.dart';
part 'staff_cubit.freezed.dart';

@injectable
class StaffCubit extends Cubit<StaffState> {
  final BookingService _bookingService;

  StaffCubit(this._bookingService) : super(StaffState.initial());

  Future<void> fetchAssignedBookings() async {
    emit(state.copyWith(isLoading: true, failureOrSuccess: none()));
    final result = await _bookingService.getBookings();
    emit(state.copyWith(
      isLoading: false,
      failureOrSuccess: some(result),
      bookings: result.getOrElse(() => []),
    ));
  }

  void toggleTask(String bookingId, String taskName) {
    final updatedCompletedTasks = Map<String, List<String>>.from(state.completedTasks);
    final tasks = updatedCompletedTasks[bookingId] ?? [];
    
    if (tasks.contains(taskName)) {
      tasks.remove(taskName);
    } else {
      tasks.add(taskName);
    }
    
    updatedCompletedTasks[bookingId] = tasks;
    emit(state.copyWith(completedTasks: updatedCompletedTasks));
  }
}
