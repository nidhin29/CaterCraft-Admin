import 'dart:developer';
import 'dart:io';

import 'package:catering/Domain/feedback/feedback_model/feedback_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/feedback/feedback_service.dart';
import 'package:catering/constants/const.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FeedbackService)
class FeedbackRepo implements FeedbackService {
  @override
  Future<Either<MainFailure, FeedbackModel>> getFeedback() async {
    try {
      final Map<String, dynamic> headers = {'Content-Type': 'application/json'};
      final Response response = await Dio(
        BaseOptions(headers: headers),
      ).get("${baseUrl}Admin/view_feedbacks_admin/",);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final feedbackModel = FeedbackModel.fromJson(response.data);
        return Right(feedbackModel);
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
  
  @override
  Future<Either<MainFailure, Unit>> delOwner(String email) async{
   try {
      final Map<String, dynamic> headers = {'Content-Type': 'application/json'};
      final Response response = await Dio(
        BaseOptions(headers: headers),
      ).delete("${baseUrl}Admin/delete_owner/",
      data: {
        "email_id_owner": email,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        return Right(unit);
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
