import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../functions/handle_request_errors.dart';

final class NotificationApi {
  const NotificationApi();
  
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    final String? tokenId = await handleRequestErrors<String?>(() => _firebaseMessaging.getToken());
    
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      badge: true,
      alert: true,
      sound: true,
    );

    log('Token:$tokenId');
  }
}
