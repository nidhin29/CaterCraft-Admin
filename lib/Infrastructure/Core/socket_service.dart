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

  void _initSocket() {
    _socket = io.io(
      baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    _socket!.onConnect((_) {
      log('Connected to socket server');
    });

    _socket!.onDisconnect((_) {
      log('Disconnected from socket server');
    });

    _socket!.onConnectError((data) => log('Connect Error: $data'));
    _socket!.onError((data) => log('Error: $data'));
  }

  void connect() {
    socket.connect();
  }

  void disconnect() {
    _socket?.disconnect();
  }

  void joinOwner(String email) {
    socket.emit('join_owner', email);
    log('Joined owner room: $email');
  }

  void joinChat(String roomId) {
    socket.emit('join_chat', roomId);
    log('Joined chat room: $roomId');
  }

  void sendMessage(String roomId, String senderEmail, String message) {
    socket.emit('send_message', {
      'roomId': roomId,
      'sender': senderEmail,
      'message': message,
      'timestamp': DateTime.now().toIso8601String(),
    });
    log('Message sent to $roomId');
  }

  void listenForMessages(Function(dynamic) onMessage) {
    socket.on('receive_message', (data) {
      log('Received message: $data');
      onMessage(data);
    });
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
