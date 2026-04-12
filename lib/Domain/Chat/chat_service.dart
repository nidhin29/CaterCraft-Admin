import 'package:catering/Domain/Chat/message_model.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChatService {
  Future<Either<MainFailure, List<MessageModel>>> getChatHistory(String roomId);
  Future<Either<MainFailure, List<dynamic>>> getRecentChats();
}
