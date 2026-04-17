import 'dart:developer';
import 'dart:io';
import 'package:catering/Domain/Chat/chat_service.dart';
import 'package:catering/Domain/Chat/conversation_model.dart';
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
  Future<Either<MainFailure, List<MessageModel>>> getChatHistory(String roomId, {int page = 1, int limit = 50}) async {
    try {
      final response = await _dio.get(
        'api/v1/chat/history/$roomId',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );
      if (response.statusCode == 200) {
        final dynamic rawData = response.data is List ? response.data : response.data['data'];
        final List<dynamic> data = (rawData is Map && rawData.containsKey('messages'))
            ? (rawData['messages'] as List)
            : (rawData as List? ?? []);
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
  Future<Either<MainFailure, List<ConversationModel>>> getRecentChats() async {
    try {
      final response = await _dio.get('api/v1/chat/recent');
      if (response.statusCode == 200) {
        final dynamic rawData = response.data is List ? response.data : response.data['data'];
        final List<dynamic> data = rawData is List ? rawData : [];
        final conversations = data.map((json) => ConversationModel.fromJson(json as Map<String, dynamic>)).toList();
        return Right(conversations);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Get Recent Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> markAsRead(String roomId) async {
    try {
      final response = await _dio.patch('api/v1/chat/mark-as-read/$roomId');
      if (response.statusCode == 200) {
        return const Right(unit);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Mark as Read Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> deleteMessage(String messageId, {required String type}) async {
    try {
      final response = await _dio.delete(
        'api/v1/chat/delete/$messageId',
        queryParameters: {'type': type},
      );
      if (response.statusCode == 200) {
        return const Right(unit);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Delete Message Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, String>> uploadMedia(File file) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file.path),
      });

      final response = await _dio.post(
        'api/v1/chat/upload',
        data: formData,
      );

      if (response.statusCode == 200) {
        final imageUrl = response.data['data']['imageUrl'];
        return Right(imageUrl);
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Upload Media Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, String>> getRecipientPublicKey(String userId) async {
    try {
      final response = await _dio.get('api/v1/security/get-public-key/$userId');
      if (response.statusCode == 200) {
        final publicKey = response.data['data']['publicKey'] as String?;
        if (publicKey != null) {
          return Right(publicKey);
        }
      }
      return const Left(MainFailure.serverFailure());
    } catch (e) {
      log('Get Public Key Error: $e');
      return const Left(MainFailure.serverFailure());
    }
  }
}
