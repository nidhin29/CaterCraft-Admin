import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:catering/Application/Chat/chat_state.dart';
import 'package:catering/Domain/Chat/chat_service.dart';
import 'package:catering/Domain/Chat/message_model.dart';
import 'package:catering/Infrastructure/Core/socket_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final ChatService _chatService;
  final SocketService _socketService;
  String? _currentRoomId;

  ChatCubit(this._chatService, this._socketService) : super(ChatState.initial()) {
    _socketService.listenForMessages(_onMessageReceived);
    _socketService.listenForTypingStatus(_onTypingStatusReceived);
    _socketService.listenForMessageDeletion(_onMessageDeleted);
  }

  void _onTypingStatusReceived(String room, String userId, bool isTyping) {
    if (!isClosed && _currentRoomId == room) {
      // Only care about matches for THIS room
      emit(state.copyWith(isOtherUserTyping: isTyping));
    }
  }

  void setTypingStatus(String userId, String roomId, bool isTyping) {
    _socketService.sendTypingStatus(roomId, userId, isTyping);
  }

  void _onMessageReceived(dynamic data) {
    if (!isClosed) {
      try {
        final newMessage = MessageModel.fromJson(data as Map<String, dynamic>);
        
        // Prevent double messages
        final isDuplicate = state.messages.any((m) => 
          (m.id != null && m.id == newMessage.id) || 
          (m.message == newMessage.message && m.senderId == newMessage.senderId && m.room == newMessage.room)
        );

        if (!isDuplicate) {
          // INSERT AT START for reversed list
          final updatedMessages = List<MessageModel>.from(state.messages)..insert(0, newMessage);
          emit(state.copyWith(messages: updatedMessages));
        }
      } catch (e) {
        log('Error parsing socket message in ChatCubit: $e');
      }
    }
  }

  void _onMessageDeleted(String messageId, String type) {
    if (isClosed) return;
    final updatedMessages = state.messages.map((m) {
      if (m.id == messageId) {
        if (type == "everyone") {
          return m.copyWith(isEveryoneDeleted: true);
        } else {
          // For me - we just hide it locally
          return null; 
        }
      }
      return m;
    }).whereType<MessageModel>().toList();

    emit(state.copyWith(messages: updatedMessages));
  }

  Future<void> sendImageMessage({
    required String senderId,
    required String senderType,
    required String receiverId,
    required String receiverType,
    required String room,
    required File imageFile,
  }) async {
    // 1. Upload to S3
    final uploadResult = await _chatService.uploadMedia(imageFile);
    
    uploadResult.fold(
      (failure) => emit(state.copyWith(error: "Failed to upload image")),
      (imageUrl) {
        // 2. Send via socket
        _socketService.sendPrivateMessage(
          senderId: senderId,
          senderType: senderType,
          receiverId: receiverId,
          receiverType: receiverType,
          message: "[Image]",
          room: room,
          imageUrl: imageUrl,
        );
      },
    );
  }

  Future<void> deleteMessage(String messageId, String room, {required String type}) async {
    // 1. Optimistic Update
    _onMessageDeleted(messageId, type);

    // 2. Persistent Delete (API + Socket)
    final result = await _chatService.deleteMessage(messageId, type: type);
    
    result.fold(
      (failure) => null, // Maybe show error
      (_) => _socketService.deleteMessage(messageId, room, type),
    );
  }

  Future<void> fetchHistory(String roomId) async {
    _currentRoomId = roomId;
    // RESET PAGINATION ON NEW ROOM
    emit(state.copyWith(
      isLoading: true, 
      error: null, 
      currentPage: 1, 
      hasMore: true,
      messages: [],
    ));
    
    final failOrSuccess = await _chatService.getChatHistory(roomId, page: 1);
    
    failOrSuccess.fold(
      (l) => emit(state.copyWith(isLoading: false, error: 'Failed to fetch history')),
      (history) {
        // REVERSE to Newest First
        final reversedHistory = history.reversed.toList();
        emit(state.copyWith(
          isLoading: false, 
          messages: reversedHistory, 
          error: null,
          hasMore: history.length >= 50,
        ));
      },
    );
  }

  Future<void> fetchMoreHistory() async {
    if (_currentRoomId == null || !state.hasMore || state.isLoadMoreLoading) return;

    final nextPage = state.currentPage + 1;
    emit(state.copyWith(isLoadMoreLoading: true));

    final failOrSuccess = await _chatService.getChatHistory(_currentRoomId!, page: nextPage);

    failOrSuccess.fold(
      (l) => emit(state.copyWith(isLoadMoreLoading: false)),
      (newHistory) {
        if (newHistory.isEmpty) {
          emit(state.copyWith(isLoadMoreLoading: false, hasMore: false));
        } else {
          // APPEND TO END of reversed list (which means older messages)
          final reversedNewHistory = newHistory.reversed.toList();
          final allMessages = [...state.messages, ...reversedNewHistory];
          
          emit(state.copyWith(
            isLoadMoreLoading: false,
            messages: allMessages,
            currentPage: nextPage,
            hasMore: newHistory.length >= 50,
          ));
        }
      },
    );
  }

  void joinRoom(String roomId) {
    _currentRoomId = roomId;
    _socketService.joinChat(roomId);
  }

  void sendMessage({
    required String senderId,
    required String senderType,
    required String receiverId,
    required String receiverType,
    required String message,
    required String room,
  }) {
    _socketService.sendPrivateMessage(
      senderId: senderId,
      senderType: senderType,
      receiverId: receiverId,
      receiverType: receiverType,
      message: message,
      room: room,
    );

    final tempMsg = MessageModel(
      senderId: senderId,
      senderType: senderType,
      receiverId: receiverId,
      receiverType: receiverType,
      message: message,
      room: room,
      createdAt: DateTime.now().toIso8601String(),
    );

    // INSERT AT START for reversed list
    final updatedMessages = List<MessageModel>.from(state.messages)..insert(0, tempMsg);
    emit(state.copyWith(messages: updatedMessages));
  }

  @override
  Future<void> close() {
    if (_currentRoomId != null) {
      _socketService.leaveChat(_currentRoomId!);
    }
    _socketService.stopListeningForMessages(_onMessageReceived);
    _socketService.stopListeningForTyping(_onTypingStatusReceived);
    _socketService.stopListeningForMessageDeletion(_onMessageDeleted);
    return super.close();
  }
}
