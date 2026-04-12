part of 'loggedin_cubit.dart';

@freezed
abstract class LoggedinState with _$LoggedinState {
  const factory LoggedinState({
    required bool value,
    required bool isOnboarded,
    int? role,
  }) = _Initial;

  factory LoggedinState.initial() => const LoggedinState(value: false, isOnboarded: false, role: null);
}
