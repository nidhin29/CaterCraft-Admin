import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class OwnerService {
  Future<Either<MainFailure, List<UserModel>>> viewStaff();
}
