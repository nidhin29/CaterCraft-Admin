import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:catering/Domain/SignIn/sign_in_model/auth_response.dart';
import 'package:catering/Domain/SignIn/sign_in_service.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  final SignInService _authService;
  final TokenService _tokenService;

  SigninCubit(this._authService, this._tokenService)
    : super(SigninState.initial());

  Future<void> signIn(String email, String password, int userType) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final response = await _authService.login(email: email, password: password, userType: userType);
    _handleAuthResponse(response, email, userType);
  }

  Future<void> registerOwner({
    required String name,
    required String email,
    required String password,
    required File license,
  }) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final response = await _authService.registerOwner(name: name, email: email, password: password, license: license);
    _handleAuthResponse(response, email, 1);
  }

  Future<void> googleLogin(String email) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final response = await _authService.googleLogin(email: email);
    _handleAuthResponse(response, email, 1);
  }

  Future<void> googleRegister({
    required String businessName,
    required File license,
  }) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    // For now, we use a placeholder email and idToken for the design demonstration
    final response = await _authService.googleRegister(
      name: businessName,
      email: "googleuser@placeholder.com",
      idToken: "placeholder_token",
      license: license,
    );
    _handleAuthResponse(response, "googleuser@placeholder.com", 1);
  }

  Future<void> sendOtp(String email) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final result = await _authService.sendOtp(email: email);
    emit(state.copyWith(
      isLoading: false,
      isFailureOrSuccess: some(result.fold((l) => left(l), (r) => right(const AuthResponse()))),
    ));
  }

  Future<void> verifyOtp(String email, String otp) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final result = await _authService.verifyOtp(email: email, otp: otp);
    emit(state.copyWith(
      isLoading: false,
      isFailureOrSuccess: some(result.fold((l) => left(l), (r) => right(const AuthResponse()))),
    ));
  }

  void _handleAuthResponse(Either<MainFailure, AuthResponse> response, String email, int userType) async {
    await response.fold(
      (failure) async {
        emit(state.copyWith(isLoading: false, isFailureOrSuccess: some(left(failure))));
      },
      (success) async {
        if (success.accessToken != null) {
          await _tokenService.saveToken(success.accessToken!);
          int role = userType;
          try {
            final Map<String, dynamic> decodedToken = JwtDecoder.decode(success.accessToken!);
            role = decodedToken['role'] ?? userType;
          } catch (e) {}
          await _tokenService.saveRole(role);
          await _tokenService.saveEmail(email);
        }
        emit(state.copyWith(isLoading: false, isFailureOrSuccess: some(right(success))));
      },
    );
  }

  Future<void> logout(String email) async {
    await _authService.logout(email: email);
    await _tokenService.clearAll();
  }
}
