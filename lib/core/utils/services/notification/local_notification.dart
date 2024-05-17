import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

abstract final class LocalNotification {
  const LocalNotification();
  static final FlutterLocalNotificationsPlugin instance =
      FlutterLocalNotificationsPlugin();

  static final BehaviorSubject<Map<String, dynamic>> onClick =
      BehaviorSubject<Map<String, dynamic>>();

  static void onNotificationTapped(NotificationResponse res) {
    if (res.payload != null) {
      onClick.add(jsonDecode(res.payload!));
    } else {
      onClick.add({});
    }
  }

  static Future<void> initNotification() async {
    AndroidInitializationSettings initSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initSettings = InitializationSettings(
      android: initSettingsAndroid,
    );
    await instance.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse: onNotificationTapped,
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
