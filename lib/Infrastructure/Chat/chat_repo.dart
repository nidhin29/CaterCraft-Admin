import 'dart:developer';
import 'package:catering/Domain/Chat/chat_service.dart';
import 'package:catering/Domain/Chat/message_model.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatService)
class ChatRepo implements ChatService {
  final Dio _dio;

  ChatRepo(this._dio);

  @override
  Future<Either<MainFailure, List<MessageModel>>> getChatHistory(String roomId) async {
    try {
      final response = await _dio.get('api/v1/chat/history/$roomId');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;
        final history = data.map((json) => MessageModel.fromJson(json as Map<String, dynamic>)).toList();
        return Right(history);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Get History Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<dynamic>>> getRecentChats() async {
    try {
      final response = await _dio.get('api/v1/chat/recent');
      if (response.statusCode == 200) {
        return Right(response.data as List<dynamic>);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Get Recent Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }
}
