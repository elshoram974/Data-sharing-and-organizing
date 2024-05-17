import 'dart:convert';
import 'dart:developer';

import 'package:data_sharing_organizing/core/utils/services/init_local.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:hive/hive.dart';

import '../../../../features/auth/domain/entities/auth_user_entity.dart';
import '../../../../features/chat/data/models/activity_model.dart';
import '../../../../features/chat/presentation/cubit/group_cubit/group_cubit.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';
import '../../enums/notification_type.dart';
import '../../functions/handle_request_errors.dart';
import '../dependency/provider_dependency.dart';
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
    FirebaseMessaging.onMessage.listen((r) => onReceivedMessage(r, true));
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await localInstance();
  await onReceivedMessage(message, false);
}

Future<void> onReceivedMessage(
    RemoteMessage remoteMessage, bool appIsOpened) async {
  final Map<String, dynamic> data = remoteMessage.data['data'] != null
      ? jsonDecode(remoteMessage.data['data'])
      : {};
  final NotificationType type = NotificationType.fromString(
    data['type'],
  );
  final Box<AuthUserEntity> user = Hive.box(AppStrings.userBox);
  // TODO: Save Notification entity

  if (AppConst.isWeb) return;

  bool isSameUser = false;
  int? groupId;

  switch (type) {
    case NotificationType.message:
      final Message message = Message.fromJson(data[type.inString]);
      isSameUser = message.author.id == user.values.firstOrNull?.id.toString();
      groupId = message.metadata?['group_id'];

      final bool exit = cancelNotification(appIsOpened, groupId, 1);
      if (exit) return;

      break;
    case NotificationType.activity:
      final ActivityModel activity =
          ActivityModel.fromJson(data[type.inString]);
      isSameUser = activity.createdBy.user.id == user.values.firstOrNull?.id;
      groupId = activity.groupId;

      final bool exit = cancelNotification(appIsOpened, groupId, 0);
      if (exit) return;

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
      payLoad: data,
    );
  }
}

bool cancelNotification(bool appIsOpened, int? groupId, int screen) {
  if (appIsOpened) {
    if (!isGroupScreenOpened) return false;
    final GroupCubit c = ProviderDependency.group;
    return c.group.id == groupId && screen == c.currentScreen;
  }
  return false;
}