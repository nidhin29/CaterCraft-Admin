import 'package:catering/Domain/feedback/feedback_model/feedback_model.dart';
import 'package:dartz/dartz.dart';
import 'package:catering/Domain/Failure/failure.dart';

abstract class FeedbackService {
  Future<Either<MainFailure, FeedbackModel>> getFeedback();
  Future<Either<MainFailure, Unit>> delOwner(String email);
}
