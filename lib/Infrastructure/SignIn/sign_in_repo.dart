import 'dart:developer';
import 'dart:io';
import 'package:catering/Domain/SignIn/sign_in_model/sign_in_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/SignIn/sign_in_service.dart';
import 'package:catering/constants/const.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SignInService)
class SignInRepo implements SignInService {
  @override
  Future<Either<MainFailure, SignInModel>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> headers = {'Content-Type': 'application/json'};
      final Response response = await Dio(BaseOptions(headers: headers)).post(
        "${baseUrl}Admin/admin_login/",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final signInModel = SignInModel.fromJson(response.data);
        return Right(signInModel);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
