import 'package:catering/Domain/Chat/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    required bool isLoading,
    required List<MessageModel> messages,
    required String? error,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadMoreLoading,
    @Default(false) bool isOtherUserTyping,
    String? recipientPublicKey,
  }) = _ChatState;

  factory ChatState.initial() => const ChatState(
        isLoading: false,
        messages: [],
        error: null,
        currentPage: 1,
        hasMore: true,
        isLoadMoreLoading: false,
        isOtherUserTyping: false,
      );
}
