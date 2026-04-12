import 'dart:io';
import 'package:catering/Domain/SignIn/sign_in_model/auth_response.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SignInService {
  Future<Either<MainFailure, AuthResponse>> login({
    required String email,
    required String password,
    required int userType,
  });

  Future<Either<MainFailure, Unit>> logout({required String email});

  Future<Either<MainFailure, AuthResponse>> registerOwner({
    required String name,
    required String email,
    required String password,
    required File license,
  });

  Future<Either<MainFailure, AuthResponse>> googleLogin({
    required String email,
  });

  Future<Either<MainFailure, AuthResponse>> googleRegister({
    required String name,
    required String email,
    required String idToken,
    required File license,
  });

  Future<Either<MainFailure, Unit>> sendOtp({
    required String email,
  });

  Future<Either<MainFailure, Unit>> verifyOtp({
    required String email,
    required String otp,
  });
}
