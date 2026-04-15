import 'dart:developer';
import 'dart:io';
import 'package:catering/Domain/Chat/message_model.dart';
import 'package:bloc/bloc.dart';
import 'package:catering/Domain/Chat/chat_service.dart';
import 'package:catering/Domain/Chat/conversation_model.dart';
import 'package:catering/Domain/bookings/booking_model/booking_model.dart';
import 'package:catering/Domain/bookings/booking_service.dart';
import 'package:catering/Domain/Failure/failure.dart';
import 'package:catering/Domain/Service/service_management_service.dart';
import 'package:catering/Infrastructure/Core/socket_service.dart';
import 'package:catering/Domain/Owner/owner_service.dart';
import 'package:catering/Domain/Service/service_model.dart';
import 'package:catering/Domain/SignIn/sign_in_model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:catering/Domain/Notification/notification_model.dart';
import 'package:catering/Infrastructure/Core/notification_service.dart';

part 'owner_state.dart';
part 'owner_cubit.freezed.dart';

@injectable
class OwnerCubit extends Cubit<OwnerState> {
  final BookingService _bookingService;
  final ServiceManagementService _serviceService;
  final OwnerService _ownerService;
  final SocketService _socketService;
  final ChatService _chatService;

  OwnerCubit(
    this._bookingService,
    this._serviceService,
    this._ownerService,
    this._socketService,
    this._chatService,
  ) : super(OwnerState.initial()) {
    _loadMocks();
    _setupGlobalMessageListener();
    _setupGlobalTypingListener();
  }

  bool _isSocketSetup = false;

  Function(String, String, bool)? _typingListener;
  Function(dynamic)? _messageListener;

  void _setupGlobalTypingListener() {
    _typingListener = (room, userId, isTyping) {
      if (isClosed) return;
      final newTypingRooms = Map<String, bool>.from(state.typingRooms);
      if (isTyping) {
        newTypingRooms[room] = true;
      } else {
        newTypingRooms.remove(room);
      }
      emit(state.copyWith(typingRooms: newTypingRooms));
    };
    _socketService.listenForTypingStatus(_typingListener!);
  }

  void _setupGlobalMessageListener() {
    _messageListener = (data) {
      if (isClosed) return;
      try {
        final newMessage = MessageModel.fromJson(data as Map<String, dynamic>);

        final myId = state.ownerDetails.fold(() => '', (u) => u.id ?? '');

        // Update the conversations list with the new message snippet and unread count
        final updatedConversations = state.conversations.map((conv) {
          if (conv.roomId == newMessage.room) {
            final isOwnMessage = newMessage.senderId == myId;
            return conv.copyWith(
              lastMessage: newMessage.message,
              lastMessageTime: newMessage.createdAt ?? DateTime.now().toIso8601String(),
              unreadCount: isOwnMessage ? conv.unreadCount : conv.unreadCount + 1,
            );
          }
          return conv;
        }).toList();

        // If it's a message from someone new, we might want to refresh the whole list
        final roomExists = state.conversations.any((c) => c.roomId == newMessage.room);
        if (!roomExists) {
          fetchRecentConversations();
        } else {
          emit(state.copyWith(conversations: updatedConversations));
        }
      } catch (e) {
        log('Error in Global Message Listener: $e');
      }
    };
    _socketService.listenForMessages(_messageListener!);
  }

  void _loadMocks() {
    final mocks = [
      NotificationModel(
        id: '1',
        title: 'New Booking Request',
        message: 'A new catering request for "Wedding Reception" has been received.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        type: 'booking',
      ),
      NotificationModel(
        id: '2',
        title: 'Service Updated',
        message: 'Your "Premium Buffet" service has been successfully updated.',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: 'service',
      ),
      NotificationModel(
        id: '3',
        title: 'System Update',
        message: 'CaterCraft v1.2 is now available with new features.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: 'system',
      ),
    ];
    emit(state.copyWith(notifications: mocks));
  }

  Future<void> fetchBookings() async {
    emit(state.copyWith(isLoading: true, bookingFailureOrSuccess: none()));
    final result = await _bookingService.getBookings();
    emit(state.copyWith(
      isLoading: false,
      bookingFailureOrSuccess: some(result),
      bookings: result.getOrElse(() => []),
    ));
  }

  void clearBookingStatus() {
    emit(state.copyWith(bookingFailureOrSuccess: none()));
  }

  Future<void> addService({
    required String name,
    required double rate,
    required String duration,
    required String description,
    required File image,
  }) async {
    emit(state.copyWith(isSubmitting: true, serviceFailureOrSuccess: none()));
    final result = await _serviceService.addService(
      name: name,
      rate: rate,
      duration: duration,
      description: description,
      image: image,
    );
    emit(state.copyWith(
      isSubmitting: false,
      serviceFailureOrSuccess: some(result),
    ));
  }

  void setupSocket(String email, [String? userId, Function(String)? onNewBooking]) {
    if (_isSocketSetup) return;
    _isSocketSetup = true;
    _socketService.connect();

    // Join the personal owner room and register for status
    _socketService.joinOwner(email, userId);

    // Explicitly register online if userId is available
    if (userId != null) {
      _socketService.registerUser(userId);
    }

    if (onNewBooking != null) {
      _socketService.listenForNewBookings(email, (data) {
        onNewBooking("New booking received!");
        fetchBookings(); // Refresh list
      });
    }
  }

  Future<void> fetchServices() async {
    emit(state.copyWith(isLoading: true));
    final result = await _serviceService.viewServices();
    emit(state.copyWith(
      isLoading: false,
      services: result.getOrElse(() => []),
    ));
  }

  void clearServiceStatus() {
    emit(state.copyWith(serviceFailureOrSuccess: none()));
  }

  Future<void> fetchStaff() async {
    emit(state.copyWith(isLoading: true, addStaffFailureOrSuccess: none()));
    final result = await _ownerService.viewStaff();
    emit(state.copyWith(
      isLoading: false,
      staffList: result.getOrElse(() => []),
    ));
  }

  Future<void> fetchDetails() async {
    emit(state.copyWith(isLoading: true));
    final result = await _ownerService.getDetails();
    result.fold(
      (failure) => null,
      (user) => emit(state.copyWith(
        isLoading: false,
        ownerDetails: some(user),
      )),
    );
  }

  Future<void> updateProfile({
    String? companyName,
    File? logo,
    String? fullName,
    File? profileImage,
  }) async {
    emit(state.copyWith(isSubmitting: true, updateProfileFailureOrSuccess: none()));
    final result = await _ownerService.updateProfile(
      companyName: companyName,
      logo: logo,
      fullName: fullName,
      profileImage: profileImage,
    );
    result.fold(
      (failure) => emit(state.copyWith(
        isSubmitting: false,
        updateProfileFailureOrSuccess: some(left(failure)),
      )),
      (user) => emit(state.copyWith(
        isSubmitting: false,
        ownerDetails: some(user),
        updateProfileFailureOrSuccess: some(right(user)),
      )),
    );
  }

  Future<void> addStaff({
    required String fullName,
    required String email,
    required String password,
    required String designation,
    String? fcmToken,
  }) async {
    emit(state.copyWith(isSubmitting: true, addStaffFailureOrSuccess: none()));
    final result = await _ownerService.addStaff(
      fullName: fullName,
      email: email,
      password: password,
      designation: designation,
      fcmToken: fcmToken,
    );
    emit(state.copyWith(
      isSubmitting: false,
      addStaffFailureOrSuccess: some(result),
    ));
    if (result.isRight()) {
      fetchStaff(); // Refresh list after adding
    }
  }

  void clearAddStaffStatus() {
    emit(state.copyWith(addStaffFailureOrSuccess: none()));
  }


  Future<Either<MainFailure, Unit>> updatePassword({required String oldPassword, required String newPassword}) async {
    emit(state.copyWith(isSubmitting: true));
    final result = await _ownerService.updatePassword(oldPassword: oldPassword, newPassword: newPassword);
    emit(state.copyWith(isSubmitting: false));
    return result;
  }


  Future<void> fetchRecentConversations() async {
    emit(state.copyWith(isLoading: true));
    final result = await _chatService.getRecentChats();
    emit(state.copyWith(
      isLoading: false,
      conversations: result.getOrElse(() => []),
    ));
  }

  Future<void> syncFCMToken() async {
    final token = await NotificationService().getFCMToken();
    if (token != null) {
      log("Syncing FCM Token: $token");
      await _ownerService.updateProfile(fcmToken: token);
    }
  }

  Future<void> markAsRead(String roomId) async {
    // Optimistic update
    final updatedConversations = state.conversations.map((conv) {
      if (conv.roomId == roomId) {
        return conv.copyWith(unreadCount: 0);
      }
      return conv;
    }).toList();
    emit(state.copyWith(conversations: updatedConversations));

    // Backend call
    await _chatService.markAsRead(roomId);
  }

  @override
  Future<void> close() {
    if (_messageListener != null) {
      _socketService.stopListeningForMessages(_messageListener!);
    }
    if (_typingListener != null) {
      _socketService.stopListeningForTyping(_typingListener!);
    }
    _socketService.disconnect();
    return super.close();
  }
}
