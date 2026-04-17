import 'dart:developer';
import 'dart:io';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Owner/owner_service.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OwnerService)
class OwnerRepo implements OwnerService {
  final Dio _dio;
  final TokenService _tokenService;

  OwnerRepo(this._dio, this._tokenService);

  @override
  Future<Either<MainFailure, List<UserModel>>> viewStaff() async {
    try {
      final role = await _tokenService.getRole() ?? 1;
      final String base = (role == 2) ? 'staff' : 'owner';
      
      final response = await _dio.get('api/v1/$base/view-staff');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data is List ? response.data : (response.data['data'] as List? ?? []);
        final staffList = data.map((json) => UserModel.fromJson(json as Map<String, dynamic>)).toList();
        return Right(staffList);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('View Staff Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> getDetails() async {
    try {
      int? role = await _tokenService.getRole();
      
      // CRITICAL: Determine base strictly. If role is null, we might be in a race condition.
      if (role == null) {
        await Future.delayed(const Duration(milliseconds: 100));
        role = await _tokenService.getRole();
      }

      final String url = (role == 2) ? 'api/v1/staff/get-profile' : 'api/v1/owner/get-details';
      
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        var user = UserModel.fromJson(response.data['data'] ?? response.data);
        if (role == 2) {
          final isUpdated = await _tokenService.getPasswordUpdated();
          user = user.copyWith(isPasswordUpdated: isUpdated);
        }
        return Right(user);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Get Details Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, UserModel>> updateProfile({
    String? companyName,
    File? logo,
    String? fullName,
    File? profileImage,
    String? fcmToken,
  }) async {
    try {
      final role = await _tokenService.getRole() ?? 1;
      final String base = role == 1 ? 'owner' : 'staff';
      
      final Map<String, dynamic> dataMap = {};
      if (companyName != null) dataMap['companyName'] = companyName;
      if (fullName != null) dataMap['fullName'] = fullName;
      if (fcmToken != null) dataMap['fcmToken'] = fcmToken;
      
      if (logo != null) {
        dataMap['logo'] = await MultipartFile.fromFile(
          logo.path,
          filename: logo.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        );
      }
      
      if (profileImage != null) {
        dataMap['profileImage'] = await MultipartFile.fromFile(
          profileImage.path,
          filename: profileImage.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        );
      }

      final formData = FormData.fromMap(dataMap);
      final response = await _dio.patch('api/v1/$base/update-profile', data: formData);

      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(response.data['data'] ?? response.data));
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Update Profile Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> addStaff({
    required String fullName,
    required String email,
    required String password,
    required String designation,
    String? fcmToken,
  }) async {
    try {
      final role = await _tokenService.getRole() ?? 1;
      final String base = (role == 2) ? 'staff' : 'owner';
      
      final Map<String, dynamic> data = {
        'fullName': fullName,
        'email': email,
        'password': password,
        'designation': designation,
      };
      if (fcmToken != null) data['fcmToken'] = fcmToken;
      
      final response = await _dio.post(
        'api/v1/$base/add-staff',
        data: data,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return const Right(unit);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Add Staff Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> updatePassword({required String oldPassword, required String newPassword}) async {
    try {
      final role = await _tokenService.getRole() ?? 1;
      final String base = role == 2 ? 'staff' : 'owner';
      
      final response = await _dio.patch(
        'api/v1/$base/update-password',
        data: {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
      );

      if (response.statusCode == 200) {
        if (role == 2) {
          await _tokenService.savePasswordUpdated(true);
        }
        return const Right(unit);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Update Password Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> updatePublicKey(String publicKey) async {
    try {
      final response = await _dio.patch(
        'api/v1/security/update-public-key',
        data: {'publicKey': publicKey},
      );
      if (response.statusCode == 200) {
        return const Right(unit);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Update Public Key Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }
}
