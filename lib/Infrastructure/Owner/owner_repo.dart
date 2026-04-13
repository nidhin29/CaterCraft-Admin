import 'dart:developer';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Owner/owner_service.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OwnerService)
class OwnerRepo implements OwnerService {
  final Dio _dio;

  OwnerRepo(this._dio);

  @override
  Future<Either<MainFailure, List<UserModel>>> viewStaff() async {
    try {
      final response = await _dio.get('api/v1/owner/view-staff');
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
}
