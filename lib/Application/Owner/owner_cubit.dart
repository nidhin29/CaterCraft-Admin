import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:catering/Domain/bookings/booking_service.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Service/service_management_service.dart';
import 'package:catering/Infrastructure/Core/socket_service.dart';
import 'package:catering/Domain/Owner/owner_service.dart';
import 'package:catering/Domain/Service/service_model.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'owner_state.dart';
part 'owner_cubit.freezed.dart';

@injectable
class OwnerCubit extends Cubit<OwnerState> {
  final BookingService _bookingService;
  final ServiceManagementService _serviceService;
  final OwnerService _ownerService;
  final SocketService _socketService;

  OwnerCubit(this._bookingService, this._serviceService, this._ownerService, this._socketService)
      : super(OwnerState.initial());

  Future<void> fetchBookings() async {
    emit(state.copyWith(isLoading: true, bookingFailureOrSuccess: none()));
    final result = await _bookingService.getBookings();
    emit(state.copyWith(
      isLoading: false,
      bookingFailureOrSuccess: some(result),
      bookings: result.getOrElse(() => []),
    ));
  }

  Future<void> addService({
    required String name,
    required double rate,
    required String duration,
    required String description,
    required File image,
  }) async {
    emit(state.copyWith(isSubmitting: true, serviceFailureOrSuccess: none()));
    final result = await _serviceService.addService(
      name: name,
      rate: rate,
      duration: duration,
      description: description,
      image: image,
    );
    emit(state.copyWith(
      isSubmitting: false,
      serviceFailureOrSuccess: some(result),
    ));
  }

  void setupSocket(String email, Function(String) onNewBooking) {
    _socketService.connect();
    _socketService.joinOwner(email);
    _socketService.listenForNewBookings(email, (data) {
      onNewBooking("New booking received!");
      fetchBookings(); // Refresh list
    });
  }

  Future<void> fetchServices() async {
    emit(state.copyWith(isLoading: true));
    final result = await _serviceService.viewServices();
    emit(state.copyWith(
      isLoading: false,
      services: result.getOrElse(() => []),
    ));
  }

  Future<void> fetchStaff() async {
    emit(state.copyWith(isLoading: true));
    final result = await _ownerService.viewStaff();
    emit(state.copyWith(
      isLoading: false,
      staffList: result.getOrElse(() => []),
    ));
  }


  @override
  Future<void> close() {
    _socketService.disconnect();
    return super.close();
  }
}
