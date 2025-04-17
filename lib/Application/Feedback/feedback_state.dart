part of 'feedback_cubit.dart';

@freezed
abstract class FeedbackState with _$FeedbackState {
  const factory FeedbackState({
    required bool isLoading,
    required Option<Either<MainFailure, FeedbackModel>> isFailureOrSuccess,
  }) = _Initial;

  factory FeedbackState.initial() =>
      FeedbackState(isLoading: false, isFailureOrSuccess: none());
}
