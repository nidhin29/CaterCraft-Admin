import 'dart:developer';
import 'dart:io';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Service/service_management_service.dart';
import 'package:catering/Domain/Service/service_model.dart';
import 'package:catering/Domain/TokenManager/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';


@LazySingleton(as: ServiceManagementService)
class ServiceManagementRepo implements ServiceManagementService {
  final Dio _dio;
  final TokenService _tokenService;

  ServiceManagementRepo(this._dio, this._tokenService);

  @override
  Future<Either<MainFailure, Unit>> addService({
    required String name,
    required double rate,
    required String duration,
    required String description,
    required File image,
  }) async {
    try {
      final String fileName = image.path.split('/').last;
      final formData = FormData.fromMap({
        'name': name,
        'rate': rate,
        'duration': duration,
        'description': description,
        'image': await MultipartFile.fromFile(
          image.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'), 
        ),
      });

      final role = await _tokenService.getRole() ?? 1;
      final String base = role == 1 ? 'owner' : 'staff';

      final response = await _dio.post(
        'api/v1/$base/add-service',
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Right(unit);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Add Service Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<ServiceModel>>> viewServices() async {
    try {
      final role = await _tokenService.getRole() ?? 1;
      final String base = role == 1 ? 'owner' : 'staff';
      final response = await _dio.get('api/v1/$base/view-services');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data is List ? response.data : (response.data['data'] as List? ?? []);
        final services = data.map((json) => ServiceModel.fromJson(json as Map<String, dynamic>)).toList();
        return Right(services);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('View Services Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }
}
