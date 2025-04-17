part of 'view_cubit.dart';

@freezed
abstract class ViewState with _$ViewState {
  const factory ViewState({
    required bool isLoading,
    required Option<Either<MainFailure, TeamModel>> isFailureOrSuccess,
    required Option<Either<MainFailure, CustomerModel>> isCustomerFailureOrSuccess,
    required Option<Either<MainFailure, Unit>> isDeleteOwner,
  }) = _Initial;

  factory ViewState.initial() =>
      ViewState(isLoading: false, isFailureOrSuccess: none(),
          isCustomerFailureOrSuccess: none(),
          isDeleteOwner: none());
}
