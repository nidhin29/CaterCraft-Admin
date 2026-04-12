import 'dart:io';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Service/service_model.dart';
import 'package:dartz/dartz.dart';

abstract class ServiceManagementService {
  Future<Either<MainFailure, Unit>> addService({
    required String name,
    required double rate,
    required String duration,
    required String description,
    required File image,
  });

  Future<Either<MainFailure, List<ServiceModel>>> viewServices();
}
