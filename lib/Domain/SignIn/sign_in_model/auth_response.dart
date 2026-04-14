import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @JsonKey(name: 'accessToken') String? accessToken,
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'refreshToken') String? refreshToken,
    @JsonKey(name: 'user') UserModel? user,
    @JsonKey(name: 'owner') UserModel? owner,
    @JsonKey(name: 'staff') UserModel? staff,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}

@Freezed(genericArgumentFactories: true)
abstract class BaseApiResponse<T> with _$BaseApiResponse<T> {
  const factory BaseApiResponse({
    @JsonKey(name: 'statusCode') required int statusCode,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'data') T? data,
  }) = _BaseApiResponse<T>;

  factory BaseApiResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseApiResponseFromJson<T>(json, fromJsonT);
}
