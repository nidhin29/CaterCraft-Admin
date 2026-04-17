import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:catering/Application/Chat/chat_state.dart';
import 'package:catering/Domain/Chat/chat_service.dart';
import 'package:catering/Domain/Chat/message_model.dart';
import 'package:catering/Infrastructure/Core/socket_service.dart';
import 'package:catering/Domain/Security/security_service.dart';
import 'package:injectable/injectable.dart';


@injectable
class ChatCubit extends Cubit<ChatState> {
  final ChatService _chatService;
  final SocketService _socketService;
  final SecurityService _securityService;
  String? _currentRoomId;

  ChatCubit(this._chatService, this._socketService, this._securityService) : super(ChatState.initial()) {
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

  void _onMessageReceived(dynamic data) async {
    if (!isClosed) {
      try {
        var newMessage = MessageModel.fromJson(data as Map<String, dynamic>);
        
        // DECRYPT IF NEEDED
        if (newMessage.isEncrypted && newMessage.encryptionNonce != null) {
          final otherPubKey = state.recipientPublicKey;
          if (otherPubKey != null) {
            try {
              final decryptedText = await _securityService.decryptText(
                ciphertextBase64: newMessage.message,
                nonceBase64: newMessage.encryptionNonce!,
                senderPublicKey: otherPubKey,
              );
              newMessage = newMessage.copyWith(message: decryptedText);
              log('🔓 E2EE: Decryption successful for message ${newMessage.id}');
            } catch (e) {
              log('❌ E2EE Decryption Error: $e');
              newMessage = newMessage.copyWith(message: "[🔒 Encrypted Message]");
            }
          } else {
            log('⚠️ E2EE: Received encrypted message but recipientPublicKey is null in state.');
            newMessage = newMessage.copyWith(message: "[🔒 Encrypted Message]");
          }
        }

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
    // 1. Prepare E2EE if available
    final recipientPubKey = state.recipientPublicKey;
    String? nonce;
    File fileToUpload = imageFile;

    if (recipientPubKey != null) {
      final bytes = await imageFile.readAsBytes();
      final encryptionResult = await _securityService.encryptBytes(
        bytes: bytes,
        recipientPublicKey: recipientPubKey,
      );
      
      // Save encrypted bytes to temp file for upload
      final tempDir = Directory.systemTemp;
      final tempFile = File('${tempDir.path}/enc_${DateTime.now().millisecondsSinceEpoch}.bin');
      await tempFile.writeAsBytes(encryptionResult['ciphertext']);
      
      fileToUpload = tempFile;
      nonce = encryptionResult['nonce'];
    }

    // 2. Upload to S3 (Encrypted or Plain)
    final uploadResult = await _chatService.uploadMedia(fileToUpload);
    
    uploadResult.fold(
      (failure) => emit(state.copyWith(error: "Failed to upload image")),
      (imageUrl) {
        // 3. Send via socket
        _socketService.sendPrivateMessage(
          senderId: senderId,
          senderType: senderType,
          receiverId: receiverId,
          receiverType: receiverType,
          message: "[Image]",
          room: room,
          imageUrl: imageUrl,
          isEncrypted: recipientPubKey != null,
          encryptionNonce: nonce,
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
      (history) async {
        // DECRYPT HISTORY
        final otherPubKey = state.recipientPublicKey;
        List<MessageModel> decryptedHistory = [];

        if (otherPubKey != null) {
          log('🔐 E2EE: Decrypting history with recipient public key.');
          for (var msg in history) {
            if (msg.isEncrypted && msg.encryptionNonce != null) {
              try {
                final decryptedText = await _securityService.decryptText(
                  ciphertextBase64: msg.message,
                  nonceBase64: msg.encryptionNonce!,
                  senderPublicKey: otherPubKey,
                );
                decryptedHistory.add(msg.copyWith(message: decryptedText));
              } catch (e) {
                log('❌ E2EE History Decryption Error: $e');
                decryptedHistory.add(msg.copyWith(message: "[🔒 Encrypted Message]"));
              }
            } else {
              decryptedHistory.add(msg);
            }
          }
        } else {
          log('ℹ️ E2EE: No recipient public key in state, showing history as is.');
          decryptedHistory = history;
        }

        // REVERSE to Newest First
        final reversedHistory = decryptedHistory.reversed.toList();
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
      (newHistory) async {
        if (newHistory.isEmpty) {
          emit(state.copyWith(isLoadMoreLoading: false, hasMore: false));
        } else {
          // DECRYPT MORE HISTORY
          final otherPubKey = state.recipientPublicKey;
          List<MessageModel> decryptedNewHistory = [];

          if (otherPubKey != null) {
            for (var msg in newHistory) {
              if (msg.isEncrypted && msg.encryptionNonce != null) {
                try {
                  final decryptedText = await _securityService.decryptText(
                    ciphertextBase64: msg.message,
                    nonceBase64: msg.encryptionNonce!,
                    senderPublicKey: otherPubKey,
                  );
                  decryptedNewHistory.add(msg.copyWith(message: decryptedText));
                } catch (e) {
                  decryptedNewHistory.add(msg.copyWith(message: "[🔒 Encrypted Message]"));
                }
              } else {
                decryptedNewHistory.add(msg);
              }
            }
          } else {
            decryptedNewHistory = newHistory;
          }

          // APPEND TO END of reversed list (which means older messages)
          final reversedNewHistory = decryptedNewHistory.reversed.toList();
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

  void joinRoom(String roomId, String otherUserId) async {
    _currentRoomId = roomId;
    _socketService.joinChat(roomId);

    // FETCH PUBLIC KEY FOR E2EE
    final result = await _chatService.getRecipientPublicKey(otherUserId);
    result.fold(
      (l) => log('⚠️ E2EE: Could not fetch recipient public key. Encryption will be disabled for this chat.'),
      (pubKey) {
        log('✅ E2EE: Recipient public key fetched successfully.');
        emit(state.copyWith(recipientPublicKey: pubKey));
      },
    );
  }

  void sendMessage({
    required String senderId,
    required String senderType,
    required String receiverId,
    required String receiverType,
    required String message,
    required String room,
  }) async {
    final recipientPubKey = state.recipientPublicKey;
    String finalMessage = message;
    String? nonce;

    if (recipientPubKey != null) {
      log('🔐 E2EE: Encrypting message...');
      final encryptionResult = await _securityService.encryptText(
        plainText: message,
        recipientPublicKey: recipientPubKey,
      );
      finalMessage = encryptionResult['ciphertext']!;
      nonce = encryptionResult['nonce'];
    } else {
      log('ℹ️ E2EE: No recipient key, sending as plain text.');
    }

    _socketService.sendPrivateMessage(
      senderId: senderId,
      senderType: senderType,
      receiverId: receiverId,
      receiverType: receiverType,
      message: finalMessage,
      room: room,
      isEncrypted: recipientPubKey != null,
      encryptionNonce: nonce,
    );

    final tempMsg = MessageModel(
      senderId: senderId,
      senderType: senderType,
      receiverId: receiverId,
      receiverType: receiverType,
      message: message, // Keep local message plain for immediate display
      room: room,
      createdAt: DateTime.now().toIso8601String(),
      isEncrypted: recipientPubKey != null,
      encryptionNonce: nonce,
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
