import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../constants/app_constants.dart';
import '../functions/handle_request_errors.dart';

final class NotificationApi {
  const NotificationApi();

  static final FirebaseMessaging firebase = FirebaseMessaging.instance;

  Future<void> init() async {
    try {
      await FirebaseMessaging.instance.requestPermission(provisional: true);

      final String? tokenId;

      if (AppConst.isWeb) {
        tokenId = await handleRequestErrors<String?>(
          () => firebase.getToken(
              vapidKey:
                  'BJGwxLCUYbKmEzMiniyeCQUiujtMuzXrBvSSsC-WVko2IafSagjp4eTA08InuqG4F5KvciBvW_xLsfzI1fM44UQ'),
        );
      } else {
        tokenId = await handleRequestErrors<String?>(() => firebase.getToken());
      }

      await firebase.setForegroundNotificationPresentationOptions(
        badge: true,
        alert: true,
        sound: true,
      );

      log('FirebaseMessagingToken:$tokenId');
    } catch (e) {
      log('Error in token: $e');
    }
  }
}
