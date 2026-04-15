import 'dart:io';
import 'package:catering/Domain/Chat/conversation_model.dart';
import 'package:catering/Domain/Chat/message_model.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ChatService {
  Future<Either<MainFailure, List<MessageModel>>> getChatHistory(String roomId, {int page = 1, int limit = 50});
  Future<Either<MainFailure, List<ConversationModel>>> getRecentChats();
  Future<Either<MainFailure, Unit>> markAsRead(String roomId);
  Future<Either<MainFailure, Unit>> deleteMessage(String messageId, {required String type});
  Future<Either<MainFailure, String>> uploadMedia(File file);
}
