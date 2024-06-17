import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

import '../../../../features/user_home/data/datasources/home_datasources/notification_local_data_sources.dart';
import '../dependency/locator.dart';

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
        const AndroidInitializationSettings('@mipmap/ic_launcher_foreground');

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

  static Future<NotificationDetails> notificationDetails({
    required int? groupId,
    required bool floatingEnabled,
    required bool lockScreenVisibility,
    required bool makeSilent,
    required bool vibrationEnabled,
  }) async {
    final NotificationLocalDataSource nLDS =
        sl.get<NotificationLocalDataSource>();
    final String? image = nLDS.getImageURL(groupId ?? -1);
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'groups-notification',
        'Groups notification',
        groupKey: groupId?.toString(),
        setAsGroupSummary: nLDS.unreadCount() <= 1 && groupId != null,
        largeIcon: image != null
            ? ByteArrayAndroidBitmap(await getImageBytes(image))
            : null,
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
    required int? groupId,
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
        groupId: groupId,
        floatingEnabled: floatingEnabled,
        lockScreenVisibility: lockScreenVisibility,
        makeSilent: makeSilent,
        vibrationEnabled: vibrationEnabled,
      ),
      payload: payLoad == null ? null : jsonEncode(payLoad),
    );
  }
}

Future<Uint8List> getImageBytes(String imageUrl) async {
  final FileInfo? fileInfo =
      await DefaultCacheManager().getFileFromCache(imageUrl);
  if (fileInfo != null) {
    final bytes = await fileInfo.file.readAsBytes();
    return bytes;
  } else {
    return Uint8List(0); // Handle error (e.g., return empty bytes)
  }
}
