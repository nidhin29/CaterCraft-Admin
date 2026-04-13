part of 'owner_cubit.dart';

@freezed
abstract class OwnerState with _$OwnerState {
  const factory OwnerState({
    required List<BookingModel> bookings,
    required List<ServiceModel> services,
    required List<UserModel> staffList,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<MainFailure, List<BookingModel>>> bookingFailureOrSuccess,
    required Option<Either<MainFailure, Unit>> serviceFailureOrSuccess,
  }) = _OwnerState;

  factory OwnerState.initial() => OwnerState(
        bookings: [],
        services: [],
        staffList: [],
        isLoading: false,
        isSubmitting: false,
        bookingFailureOrSuccess: none(),
        serviceFailureOrSuccess: none(),
      );
}
