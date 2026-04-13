import 'dart:developer';
import 'dart:io';
import 'package:catering/Domain/SignIn/sign_in_model/auth_response.dart';
import 'package:catering/Domain/SignIn/sign_in_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignInService)
class SignInRepo implements SignInService {
  final Dio _dio;

  SignInRepo(this._dio);

  @override
  Future<Either<MainFailure, AuthResponse>> login({
    required String email,
    required String password,
    required int userType,
  }) async {
    try {
      final response = await _dio.post(
        'api/v1/owner/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final authResponse = AuthResponse.fromJson(response.data);
        return Right(authResponse);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Login Error: $e');
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          return const Left(MainFailure.authFailure());
        } else if (e.response?.statusCode == 400) {
          return const Left(MainFailure.incorrectCredential());
        }
      }
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> logout({required String email}) async {
    try {
      final response = await _dio.post(
        'api/v1/owner/logout',
        data: {'email': email},
      );

      if (response.statusCode == 200) {
        return const Right(unit);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Logout Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, AuthResponse>> registerOwner({
    required String name,
    required String email,
    required String password,
    required File license,
  }) async {
    try {
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'license': await MultipartFile.fromFile(
          license.path,
          filename: license.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      final response = await _dio.post(
        'api/v1/owner/register-owner',
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(AuthResponse.fromJson(response.data));
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Register Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, AuthResponse>> googleLogin({required String tokenID}) async {
    try {
      final response = await _dio.post(
        'api/v1/owner/google-login',
        data: {'tokenID': tokenID},
      );
      if (response.statusCode == 200) {
        return Right(AuthResponse.fromJson(response.data['data'] ?? response.data));
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Google Login Error: $e');
      if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authNotFound());
      }
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, AuthResponse>> googleRegister({
    required String companyName,
    required String tokenID,
    required File license,
  }) async {
    try {
      final formData = FormData.fromMap({
        'companyName': companyName,
        'tokenID': tokenID,
        'license': await MultipartFile.fromFile(
          license.path,
          filename: license.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ),
      });

      final response = await _dio.post(
        'api/v1/owner/google-register',
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(AuthResponse.fromJson(response.data));
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Google Register Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> sendOtp({required String email}) async {
    try {
      final response = await _dio.post(
        'api/v1/owner/send-otp',
        data: {'email': email},
      );
      if (response.statusCode == 200) return const Right(unit);
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Send OTP Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, AuthResponse>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _dio.post(
        'api/v1/owner/verify-otp',
        data: {'email': email, 'otp': otp},
      );
      if (response.statusCode == 200) {
        return Right(AuthResponse.fromJson(response.data['data'] ?? response.data));
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Verify OTP Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }
}
