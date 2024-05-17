import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../constants/app_constants.dart';
import '../../functions/handle_request_errors.dart';
import 'local_notification.dart';

final class NotificationApi {
  const NotificationApi();

  static final FirebaseMessaging firebase = FirebaseMessaging.instance;

  Future<void> init() async {
    try {
      await FirebaseMessaging.instance.requestPermission(
        alert: AppConst.isWeb,
        announcement: false,
        badge: AppConst.isWeb,
        carPlay: AppConst.isWeb,
        criticalAlert: false,
        provisional: false,
        sound: AppConst.isWeb,
      );

      final String? tokenId;

      if (AppConst.isWeb) {
        tokenId = await handleRequestErrors<String?>(
          () => firebase.getToken(
            vapidKey:
                'BJGwxLCUYbKmEzMiniyeCQUiujtMuzXrBvSSsC-WVko2IafSagjp4eTA08InuqG4F5KvciBvW_xLsfzI1fM44UQ',
          ),
        );
      } else {
        tokenId = await handleRequestErrors<String?>(() => firebase.getToken());
      }

      await Future.wait([
        LocalNotification.initNotification(),
        firebase.subscribeToTopic('admin'),
        firebase.setForegroundNotificationPresentationOptions(
          alert: AppConst.isWeb,
          badge: AppConst.isWeb,
          sound: AppConst.isWeb,
        ),
      ]);

      log('FirebaseMessagingToken:$tokenId');
    } catch (e) {
      log('Error in token: $e');
    }

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(onReceivedMessage);
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  onReceivedMessage(message);
}

void onReceivedMessage(RemoteMessage remoteMessage) {
  // TODO: make if user is the sender not show anything
  LocalNotification.showNotification(
    title: remoteMessage.notification?.title,
    body: remoteMessage.notification?.body,
    payLoad: remoteMessage.data,
  );
}
