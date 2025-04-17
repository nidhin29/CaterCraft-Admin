import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/SignIn/sign_in_model/sign_in_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignInService {
  Future<Either<MainFailure, SignInModel>> signInWithEmailAndPassword(
    String email,
    String password,
  );
}
