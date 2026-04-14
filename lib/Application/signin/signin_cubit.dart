import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:catering/Domain/SignIn/sign_in_model/auth_response.dart';
import 'package:catering/Domain/SignIn/sign_in_service.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:injectable/injectable.dart';

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
    await _handleAuthResponse(response, email, userType);
  }

  Future<void> registerOwner({
    required String name,
    required String email,
    required String password,
    required File license,
    required File logo,
  }) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final response = await _authService.registerOwner(name: name, email: email, password: password, license: license, logo: logo);
    await _handleAuthResponse(response, email, 1);
  }

  Future<void> googleLogin(String tokens) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none(), isGoogleRegistrationRequired: false));
    final result = await _authService.googleLogin(tokenID: tokens);
    result.fold(
      (failure) {
        if (failure == const MainFailure.authNotFound()) {
          emit(state.copyWith(
            isLoading: false,
            isGoogleRegistrationRequired: true,
            googleTokenID: tokens,
            isFailureOrSuccess: none(),
          ));
        } else {
          emit(state.copyWith(isLoading: false, isFailureOrSuccess: some(left(failure))));
        }
      },
      (success) async {
        await _handleAuthResponse(Right(success), "", 1);
      },
    );
  }

  Future<void> googleRegister({
    required String companyName,
    required String tokenID,
    required File license,
    required File logo,
  }) async {
    emit(state.copyWith(isLoading: true, isFailureOrSuccess: none()));
    final result = await _authService.googleRegister(
      companyName: companyName,
      tokenID: tokenID,
      license: license,
      logo: logo,
    );
    await _handleAuthResponse(result, "", 1);
  }

  Future<void> sendOtp(String email) async {
    emit(state.copyWith(isSendingOtp: true, otpSendFailureOrSuccess: none()));
    final result = await _authService.sendOtp(email: email);
    emit(state.copyWith(
      isSendingOtp: false,
      otpSendFailureOrSuccess: some(result),
    ));
  }

  Future<void> verifyOtp(String email, String otp) async {
    emit(state.copyWith(isVerifyingOtp: true, isFailureOrSuccess: none()));
    final result = await _authService.verifyOtp(email: email, otp: otp);
    await _handleAuthResponse(result, email, 1);
  }

  Future<void> _handleAuthResponse(Either<MainFailure, AuthResponse> response, String email, int userType) async {
    await response.fold(
      (failure) async {
        emit(state.copyWith(isLoading: false, isVerifyingOtp: false, isFailureOrSuccess: some(left(failure))));
      },
      (success) async {
        log('DEBUG: Starting _handleAuthResponse - userType: $userType');
        final String? token = success.accessToken ?? success.token;
        if (token != null) {
          // Save role immediately to avoid any race conditions
          final int role = userType;
          await _tokenService.saveRole(role);
          log('DEBUG: Role saved successfully: $role');

          await _tokenService.saveToken(token);
          log('DEBUG: Token saved successfully');

          log('DEBUG: Auth Response - userType: $userType, Final role: $role');
          
          final finalEmail = success.user?.email ?? success.owner?.email ?? success.staff?.email ?? email;
          if (finalEmail.isNotEmpty) {
            await _tokenService.saveEmail(finalEmail);
          }

          final finalCompany = success.owner?.companyName ?? success.user?.companyName ?? success.staff?.companyName;
          if (finalCompany != null && finalCompany.isNotEmpty) {
            await _tokenService.saveCompanyName(finalCompany);
          }

          final finalLogo = success.owner?.companyLogo ?? success.user?.companyLogo ?? success.staff?.companyLogo;
          if (finalLogo != null) {
            await _tokenService.saveCompanyLogo(finalLogo);
          }

          final finalStatus = success.owner?.verificationStatus ?? success.user?.verificationStatus ?? success.staff?.verificationStatus;
          if (finalStatus != null) {
            await _tokenService.saveVerificationStatus(finalStatus);
          }

          final finalUsername = success.owner?.username ?? success.user?.username ?? success.staff?.username;
          if (finalUsername != null) {
            await _tokenService.saveUsername(finalUsername);
          }
        }
        emit(state.copyWith(isLoading: false, isVerifyingOtp: false, isFailureOrSuccess: some(right(success))));
      },
    );
  }

  Future<void> logout(String email) async {
    final role = await _tokenService.getRole() ?? 1; // Default to owner if role is missing
    await _authService.logout(email: email, role: role);
    await _tokenService.clearAll();
  }
}
