import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:catering/Presentation/Home/notifications_screen.dart';
import 'package:catering/main.dart';
import 'package:catering/Domain/Security/security_service.dart';
import 'package:firebase_core/firebase_core.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications = FlutterLocalNotificationsPlugin();

  // Stream for foreground notification events
  final _onNotificationReceivedController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get onNotificationReceived => _onNotificationReceivedController.stream;

  // Android Notification Channel
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  Future<void> initialize() async {
    // 1. Request permissions
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    }

    // 2. Setup Local Notifications for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    // Check if the icon exists, if not fallback to typical generic icon
    // (Note: initialize will fail if valid icon is not found)
    
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(),
    );

    await _localNotifications.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    // 3. Listen for Foreground Messages (Both Notification and Data)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Foreground Message received');
      _showLocalNotification(message);
      
      // Broadcast to any listening Cubits for UI refresh
      _onNotificationReceivedController.add(message.data);
    });

    // 4. Listen for Background/Terminated Click interactions
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('Notification clicked while app in background');
      _handleNotificationClick(message.data);
    });

    // 5. Check for Initial Message (if app was terminated and opened via notification)
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      debugPrint('Notification clicked while app was terminated');
      _handleNotificationClick(initialMessage.data);
    }
    
    // Get FCM Token with a timeout to prevent startup hangs
    try {
      String? token = await _fcm.getToken().timeout(const Duration(seconds: 5));
      debugPrint("FCM Token: $token");
    } catch (e) {
      debugPrint("FCM Token Retrieval Timeout or Error: $e");
    }
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    String? title = message.notification?.title;
    String? body = message.notification?.body;
    final data = message.data;

    // IF E2EE DATA MESSAGE
    if (data['isEncrypted'] == 'true' || data['encryptedBody'] != null) {
      title = data['title'] ?? "New Message";
      final encryptedBody = data['encryptedBody'];
      final nonce = data['nonce'];
      final senderPubKey = data['senderPublicKey'];

      if (encryptedBody != null && nonce != null && senderPubKey != null) {
        try {
          // Manual instantiation for isolate compatibility
          final security = SecurityService(); 
          body = await security.decryptText(
            ciphertextBase64: encryptedBody,
            nonceBase64: nonce,
            senderPublicKey: senderPubKey,
          );
        } catch (e) {
          debugPrint("Failed to decrypt background notification: $e");
          body = "🔒 New encrypted message";
        }
      }
    }

    if (title != null && body != null) {
      AndroidNotification? android = message.notification?.android;

      await _localNotifications.show(
        id: message.messageId?.hashCode ?? DateTime.now().millisecondsSinceEpoch,
        title: title,
        body: body,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            importance: Importance.max,
            priority: Priority.high,
            icon: android?.smallIcon ?? '@mipmap/ic_launcher',
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
  }

  void _onNotificationTapped(NotificationResponse response) {
    _navigateToNotification();
  }

  void _handleNotificationClick(Map<String, dynamic> data) {
    _navigateToNotification();
  }

  void _navigateToNotification() {
    MyApp.navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
    );
  }

  Future<String?> getFCMToken() async {
    try {
      return await _fcm.getToken();
    } catch (e) {
      debugPrint("Error fetching FCM Token: $e");
      return null;
    }
  }
}

// Top-level background message handler
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("Handling a background message: ${message.messageId}");
  
  // Directly use the logic to show notification (Decryption happens inside)
  await NotificationService()._showLocalNotification(message);
}
