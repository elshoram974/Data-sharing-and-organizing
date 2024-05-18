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
    await instance
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

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
    await instance.cancelAll();
  }

  static notificationDetails({
    required bool floatingEnabled,
    required bool lockScreenVisibility,
    required bool makeSilent,
    required bool vibrationEnabled,
  }) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'groups-notification',
        'Groups notification',
        channelShowBadge: true,
        enableLights: true,
        importance: floatingEnabled ? Importance.max : Importance.unspecified,
        priority: floatingEnabled ? Priority.max : Priority.min,
        enableVibration: vibrationEnabled,
        visibility: lockScreenVisibility
            ? NotificationVisibility.public
            : NotificationVisibility.secret,
        silent: makeSilent,
        playSound: !makeSilent,
      ),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    Map<String, dynamic>? payLoad,
    required bool floatingEnabled,
    required bool lockScreenVisibility,
    required bool makeSilent,
    required bool vibrationEnabled,
  }) async {
    return await instance.show(
      id,
      title,
      body,
      await notificationDetails(
        floatingEnabled: floatingEnabled,
        lockScreenVisibility: lockScreenVisibility,
        makeSilent: makeSilent,
        vibrationEnabled: vibrationEnabled,
      ),
      payload: payLoad == null ? null : jsonEncode(payLoad),
    );
  }
}
