import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:hive/hive.dart';

import '../../../../features/auth/domain/entities/auth_user_entity.dart';
import '../../../../features/chat/data/models/activity_model.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';
import '../../enums/notification_type.dart';
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
        if (!AppConst.isWeb) LocalNotification.initNotification(),
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
  await onReceivedMessage(message);
}

Future<void> onReceivedMessage(RemoteMessage remoteMessage) async {
  final NotificationType type = NotificationType.fromString(
    remoteMessage.data['type'],
  );

  await Future.wait([
    Hive.openBox<AuthUserEntity>(AppStrings.userBox),
  ]);

  final Box<AuthUserEntity> user = Hive.box(AppStrings.userBox);

  if (AppConst.isWeb) return;

  bool isSameUser = false;
  int? groupId;

  switch (type) {
    case NotificationType.message:
      final Message message = Message.fromJson(
        remoteMessage.data[remoteMessage.data['type']],
      );
      isSameUser = message.author.id == user.values.firstOrNull?.id.toString();
      groupId = message.metadata?['group_id'];
      break;
    case NotificationType.activity:
      final ActivityModel activity = ActivityModel.fromJson(
        remoteMessage.data[remoteMessage.data['type']],
      );
      isSameUser = activity.createdBy.user.id == user.values.firstOrNull?.id;
      groupId = activity.groupId;
      break;
    case NotificationType.info:
    default:
      isSameUser = false;
  }
  if (!isSameUser) {
    LocalNotification.showNotification(
      id: groupId ?? 0,
      title: remoteMessage.notification?.title,
      body: remoteMessage.notification?.body,
      payLoad: remoteMessage.data,
    );
  }
}
