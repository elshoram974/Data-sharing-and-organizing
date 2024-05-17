import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract final class LocalNotification {
  const LocalNotification();
  static final FlutterLocalNotificationsPlugin instance =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    AndroidInitializationSettings initSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initSettings = InitializationSettings(
      android: initSettingsAndroid,
    );
    await instance.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        print(response);
      },
    );
  }

  static notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'sharikna-notification',
        'Sharikna notification',
        importance: Importance.max,
        channelShowBadge: true,
        enableLights: true,
        enableVibration: true,
        playSound: true,
        priority: Priority.max,
      ),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    Map<String, dynamic>? payLoad,
  }) async {
    return instance.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payLoad == null ? null : jsonEncode(payLoad),
    );
  }
}
