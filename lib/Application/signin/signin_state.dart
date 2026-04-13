part of 'signin_cubit.dart';

@freezed
abstract class SigninState with _$SigninState {
  const factory SigninState({
    required bool isLoading,
    required bool isSendingOtp,
    required bool isVerifyingOtp,
    required bool isGoogleRegistrationRequired,
    required String? googleTokenID,
    required Option<Either<MainFailure, AuthResponse>> isFailureOrSuccess,
    required Option<Either<MainFailure, Unit>> otpSendFailureOrSuccess,
  }) = _SigninState;

  factory SigninState.initial() => SigninState(
        isLoading: false,
        isSendingOtp: false,
        isVerifyingOtp: false,
        isGoogleRegistrationRequired: false,
        googleTokenID: null,
        isFailureOrSuccess: none(),
        otpSendFailureOrSuccess: none(),
      );
}
