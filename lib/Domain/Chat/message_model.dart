import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    @JsonKey(name: '_id') String? id,
    required String senderId,
    required String senderType,
    required String receiverId,
    required String receiverType,
    required String message,
    required String room,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @Default(false) bool isEveryoneDeleted,
    @Default([]) List<String> deletedBy,
    @JsonKey(name: 'createdAt') String? createdAt,
    @Default(false) bool isEncrypted,
    @JsonKey(name: 'encryptionNonce') String? encryptionNonce,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
