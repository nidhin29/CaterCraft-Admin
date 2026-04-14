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
import 'package:catering/Domain/Notification/notification_model.dart';

part 'owner_state.dart';
part 'owner_cubit.freezed.dart';

@injectable
class OwnerCubit extends Cubit<OwnerState> {
  final BookingService _bookingService;
  final ServiceManagementService _serviceService;
  final OwnerService _ownerService;
  final SocketService _socketService;

  OwnerCubit(this._bookingService, this._serviceService, this._ownerService, this._socketService)
      : super(OwnerState.initial()) {
    _loadMocks();
  }

  void _loadMocks() {
    final mocks = [
      NotificationModel(
        id: '1',
        title: 'New Booking Request',
        message: 'A new catering request for "Wedding Reception" has been received.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        type: 'booking',
      ),
      NotificationModel(
        id: '2',
        title: 'Service Updated',
        message: 'Your "Premium Buffet" service has been successfully updated.',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: 'service',
      ),
      NotificationModel(
        id: '3',
        title: 'System Update',
        message: 'CaterCraft v1.2 is now available with new features.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: 'system',
      ),
    ];
    emit(state.copyWith(notifications: mocks));
  }

  Future<void> fetchBookings() async {
    emit(state.copyWith(isLoading: true, bookingFailureOrSuccess: none()));
    final result = await _bookingService.getBookings();
    emit(state.copyWith(
      isLoading: false,
      bookingFailureOrSuccess: some(result),
      bookings: result.getOrElse(() => []),
    ));
  }

  void clearBookingStatus() {
    emit(state.copyWith(bookingFailureOrSuccess: none()));
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

  void clearServiceStatus() {
    emit(state.copyWith(serviceFailureOrSuccess: none()));
  }

  Future<void> fetchStaff() async {
    emit(state.copyWith(isLoading: true, addStaffFailureOrSuccess: none()));
    final result = await _ownerService.viewStaff();
    emit(state.copyWith(
      isLoading: false,
      staffList: result.getOrElse(() => []),
    ));
  }

  Future<void> fetchDetails() async {
    emit(state.copyWith(isLoading: true));
    final result = await _ownerService.getDetails();
    result.fold(
      (failure) => null,
      (user) => emit(state.copyWith(
        isLoading: false,
        ownerDetails: some(user),
      )),
    );
  }

  Future<void> updateProfile({
    String? companyName,
    File? logo,
    String? fullName,
    File? profileImage,
  }) async {
    emit(state.copyWith(isSubmitting: true, updateProfileFailureOrSuccess: none()));
    final result = await _ownerService.updateProfile(
      companyName: companyName,
      logo: logo,
      fullName: fullName,
      profileImage: profileImage,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        isSubmitting: false,
        updateProfileFailureOrSuccess: some(left(failure)),
      )),
      (user) => emit(state.copyWith(
        isSubmitting: false,
        ownerDetails: some(user),
        updateProfileFailureOrSuccess: some(right(user)),
      )),
    );
  }

  Future<void> addStaff({
    required String fullName,
    required String email,
    required String password,
    required String designation,
  }) async {
    emit(state.copyWith(isSubmitting: true, addStaffFailureOrSuccess: none()));
    final result = await _ownerService.addStaff(
      fullName: fullName,
      email: email,
      password: password,
      designation: designation,
    );
    emit(state.copyWith(
      isSubmitting: false,
      addStaffFailureOrSuccess: some(result),
    ));
    if (result.isRight()) {
      fetchStaff(); // Refresh list after adding
    }
  }

  void clearAddStaffStatus() {
    emit(state.copyWith(addStaffFailureOrSuccess: none()));
  }


  Future<Either<MainFailure, Unit>> updatePassword({required String oldPassword, required String newPassword}) async {
    emit(state.copyWith(isSubmitting: true));
    final result = await _ownerService.updatePassword(oldPassword: oldPassword, newPassword: newPassword);
    emit(state.copyWith(isSubmitting: false));
    return result;
  }


  @override
  Future<void> close() {
    _socketService.disconnect();
    return super.close();
  }
}
