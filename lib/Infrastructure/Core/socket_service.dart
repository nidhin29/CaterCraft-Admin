import 'dart:developer';
import 'package:catering/constants/const.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

@lazySingleton
class SocketService {
  io.Socket? _socket;

  io.Socket get socket {
    if (_socket == null) {
      _initSocket();
    }
    return _socket!;
  }

  final List<Function(dynamic)> _messageListeners = [];
  final List<Function(String, String, bool)> _typingListeners = [];
  final List<Function(String, String)> _deletionListeners = [];

  void _initSocket() {
    _socket = io.io(
      baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect() // Often better to let it handle reconnection
          .build(),
    );

    _socket!.onConnect((_) {
      log('🟢 Socket Connection Established: ${_socket!.id}');
    });

    _socket!.onDisconnect((reason) {
      log('🔴 Socket Disconnected: $reason');
    });

    _socket!.onConnectError((data) => log('⚠️ Connect Error: $data'));
    _socket!.onError((data) => log('❌ Socket Error: $data'));

    // Global listener for new messages that broadcasts to all registered callbacks
    _socket!.on('new_message', (data) {
      log('📩 Global Socket: New message received');
      for (var listener in List.from(_messageListeners)) {
        try {
          listener(data);
        } catch (e) {
          log('Error in message listener: $e');
        }
      }
    });

    // Global listener for typing status
    _socket!.on('user_typing', (data) {
      log('⌨️ Global Socket: User typing event');
      if (data != null && data['userId'] != null) {
        final userId = data['userId'].toString();
        final roomId = (data['room'] ?? '').toString();
        final isTyping = data['isTyping'] == true;
        for (var listener in List.from(_typingListeners)) {
          try {
            listener(roomId, userId, isTyping);
          } catch (e) {
            log('Error in typing listener: $e');
          }
        }
      }
    });

    // Global listener for message deletion
    _socket!.on('message_deleted', (data) {
      log('🗑️ Global Socket: Message deleted event');
      if (data != null && data['messageId'] != null) {
        final messageId = data['messageId'].toString();
        final type = data['type'].toString();
        for (var listener in List.from(_deletionListeners)) {
          try {
            listener(messageId, type);
          } catch (e) {
            log('Error in deletion listener: $e');
          }
        }
      }
    });
  }

  void connect() {
    if (!socket.connected) {
      socket.connect();
    }
  }

  void disconnect() {
    _socket?.disconnect();
  }

  void leaveChat(String room) {
    socket.emit('leave_chat', room);
    log('Left room: $room');
  }

  void joinOwner(String email, [String? userId]) {
    socket.emit('join_owner', {
      'email': email,
      'userId': userId,
    });
    log('📡 Joined owner room: $email | User: $userId');
  }

  void registerUser(String userId) {
    socket.emit('register_user', {'userId': userId});
    log('🌐 Registered online: $userId');
  }

  void joinChat(String roomId) {
    // FIX: Backend expects an object { roomId } for destructuring
    socket.emit('join_chat', {'roomId': roomId});
    log('💬 Joining chat room: $roomId');
  }

  void sendPrivateMessage({
    required String senderId,
    required String senderType,
    required String receiverId,
    required String receiverType,
    required String message,
    required String room,
    String? imageUrl,
  }) {
    socket.emit('send_private_message', {
      'senderId': senderId,
      'senderType': senderType,
      'receiverId': receiverId,
      'receiverType': receiverType,
      'message': message,
      'room': room,
      'imageUrl': imageUrl,
    });
    log('✉️ Emitting message to $room ${imageUrl != null ? "(with image)" : ""}');
  }

  void listenForMessages(Function(dynamic) onMessage) {
    if (!_messageListeners.contains(onMessage)) {
      _messageListeners.add(onMessage);
    }
  }

  void stopListeningForMessages(Function(dynamic) onMessage) {
    _messageListeners.remove(onMessage);
  }

  void clearAllMessageListeners() {
    _messageListeners.clear();
  }

  void sendTypingStatus(String room, String userId, bool isTyping) {
    socket.emit('typing', {
      'room': room,
      'userId': userId,
      'isTyping': isTyping,
    });
  }

  void listenForTypingStatus(Function(String room, String userId, bool isTyping) onTyping) {
    if (!_typingListeners.contains(onTyping)) {
      _typingListeners.add(onTyping);
    }
  }

  void stopListeningForTyping(Function(String room, String userId, bool isTyping) onTyping) {
    _typingListeners.remove(onTyping);
  }

  void listenForMessageDeletion(Function(String messageId, String type) onDeletion) {
    if (!_deletionListeners.contains(onDeletion)) {
      _deletionListeners.add(onDeletion);
    }
  }

  void stopListeningForMessageDeletion(Function(String messageId, String type) onDeletion) {
    _deletionListeners.remove(onDeletion);
  }

  void deleteMessage(String messageId, String room, String type) {
    socket.emit('delete_message', {
      'messageId': messageId,
      'room': room,
      'type': type,
    });
  }

  void clearAllTypingListeners() {
    _typingListeners.clear();
  }

  void listenForNewBookings(String email, Function(dynamic) onNewBooking) {
    socket.on('new_booking_$email', (data) {
      log('Received new booking alert: $data');
      onNewBooking(data);
    });
  }

  void stopListening(String email) {
    _socket?.off('new_booking_$email');
  }
}
