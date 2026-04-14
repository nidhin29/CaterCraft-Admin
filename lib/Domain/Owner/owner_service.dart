import 'dart:io';

import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class OwnerService {
  Future<Either<MainFailure, List<UserModel>>> viewStaff();
  Future<Either<MainFailure, UserModel>> getDetails();
  Future<Either<MainFailure, UserModel>> updateProfile({
    String? companyName,
    File? logo,
    String? fullName,
    File? profileImage,
  });
  Future<Either<MainFailure, Unit>> addStaff({
    required String fullName,
    required String email,
    required String password,
    required String designation,
  });
  Future<Either<MainFailure, Unit>> updatePassword({required String oldPassword, required String newPassword});
}
