import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() = _ClientFailure;
  const factory MainFailure.serverFailure() = _ServerFailure;
  const factory MainFailure.authFailure() = AuthFailure;
  const factory MainFailure.incorrectCredential() = IncorrectCredential;
  const factory MainFailure.otherFailure() = otherFailure;
}
