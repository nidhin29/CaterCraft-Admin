part of 'signin_cubit.dart';

@freezed
abstract class SigninState with _$SigninState {
  const factory SigninState({
    required bool isLoading,
    required Option<Either<MainFailure, SignInModel>> isFailureOrSuccess,
  }) = _SigninState;

  factory SigninState.initial() =>
      SigninState(isLoading: false, isFailureOrSuccess: none());
}
