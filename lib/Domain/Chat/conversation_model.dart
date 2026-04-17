import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_model.freezed.dart';

@freezed
abstract class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    required String roomId,
    required String lastMessage,
    required String lastMessageTime,
    required String otherUserId,
    required String otherUserName,
    String? otherUserImage,
    required String otherUserType,
    String? otherUserPublicKey,
    @Default(false) bool isOnline,
    @Default(0) int unreadCount,
    @Default(false) bool isEncrypted,
    String? encryptionNonce,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    // Flatten logic for the nested otherUser object from backend
    final otherUser = json['otherUser'] as Map<String, dynamic>? ?? {};
    return ConversationModel(
      roomId: json['roomId'] ?? '',
      lastMessage: json['lastMessage'] ?? '',
      lastMessageTime: json['lastMessageTime'] ?? '',
      otherUserId: otherUser['id'] ?? '',
      otherUserName: otherUser['name'] ?? 'Unknown User',
      otherUserImage: otherUser['image'],
      otherUserType: otherUser['type'] ?? 'Staff',
      otherUserPublicKey: otherUser['publicKey'],
      isOnline: json['isOnline'] ?? false,
      unreadCount: json['unreadCount'] ?? 0,
      isEncrypted: json['isEncrypted'] ?? false,
      encryptionNonce: json['encryptionNonce'],
    );
  }
}
