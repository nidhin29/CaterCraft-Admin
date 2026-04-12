part of 'owner_cubit.dart';

@freezed
abstract class OwnerState with _$OwnerState {
  const factory OwnerState({
    required List<BookingModel> bookings,
    required bool isLoading,
    required bool isSubmitting,
    required Option<Either<MainFailure, List<BookingModel>>> bookingFailureOrSuccess,
    required Option<Either<MainFailure, Unit>> serviceFailureOrSuccess,
  }) = _OwnerState;

  factory OwnerState.initial() => OwnerState(
        bookings: [],
        isLoading: false,
        isSubmitting: false,
        bookingFailureOrSuccess: none(),
        serviceFailureOrSuccess: none(),
      );
}
