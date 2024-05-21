import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:data_sharing_organizing/core/utils/services/init_local.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:hive/hive.dart';

import '../../../../features/auth/domain/entities/auth_user_entity.dart';
import '../../../../features/chat/data/models/activity_model.dart';
import '../../../../features/chat/domain/entities/activity_entity.dart';
import '../../../../features/chat/presentation/cubit/group_cubit/group_cubit.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/notification_local_data_sources.dart';
import '../../../../features/user_home/presentation/cubit/user_notification_cubit/user_notification_cubit.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';
import '../../enums/notification_type.dart';
import '../../functions/handle_request_errors.dart';
import '../dependency/locator.dart';
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
        if (!AppConst.isWeb) ...[
          LocalNotification.initNotification(),
          firebase.subscribeToTopic('admin')
        ],
        firebase.setForegroundNotificationPresentationOptions(
          alert: AppConst.isWeb,
          badge: AppConst.isWeb,
          sound: AppConst.isWeb,
        ),
      ]);

      log('FirebaseMessagingToken:$tokenId');
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
      FirebaseMessaging.onMessage.listen((r) => onReceivedMessage(r, true));
    } catch (e) {
      log('Error in token: $e');
    }
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    if (!Hive.isAdapterRegistered(1)) {
      await localInstance();
      initDependencies();
    }
    await onReceivedMessage(message, false);
  } catch (e) {
    log("Error :- aaa ---- $e");
  }
}

Future<void> onReceivedMessage(
  RemoteMessage remoteMessage,
  bool appIsOpened,
) async {
  final Map<String, dynamic> data = remoteMessage.data['data'] != null
      ? jsonDecode(remoteMessage.data['data'])
      : {};
  final NotificationType type = NotificationType.fromString(
    data['type'],
  );
  final Box<AuthUserEntity> user = Hive.box(AppStrings.userBox);
  final NotificationLocalDataSource nLDS =
      sl.get<NotificationLocalDataSource>();
  final HomeLocalDataSource hLDS = sl.get<HomeLocalDataSource>();

  bool isSameUser = false;
  int? groupId;
  final int notificationId =
      math.Random().nextInt(4999) * math.Random().nextInt(4999);

  switch (type) {
    case NotificationType.message:
      final Message message = Message.fromJson(data[type.inString]);
      isSameUser = message.author.id == user.values.firstOrNull?.id.toString();
      groupId = message.metadata?['group_id'];

      final ActivityModel activity = ActivityModel.fromEntity(
        ActivityEntity.fromMessageAllData(message).copyWith(groupId: groupId),
      );

      final bool exit = handleNotificationInApp(
        notificationId,
        appIsOpened,
        activity,
        1,
      );
      if (exit) return;
      await Future.wait([
        nLDS.saveNotification(
          notificationId: notificationId,
          screen: 1,
          groupId: groupId!,
          activity: activity,
        ),
        hLDS.updateLastActivity(activity, 1)
      ]);

      break;
    case NotificationType.activity:
      final ActivityModel activity =
          ActivityModel.fromJson(data[type.inString]);
      isSameUser = activity.createdBy.user.id == user.values.firstOrNull?.id;
      groupId = activity.groupId;

      final bool exit = handleNotificationInApp(
        notificationId,
        appIsOpened,
        activity,
        0,
      );
      if (exit) return;

      await Future.wait([
        nLDS.saveNotification(
          notificationId: notificationId,
          screen: 0,
          groupId: groupId,
          activity: activity,
        ),
        hLDS.updateLastActivity(activity, 0),
      ]);

      break;
    case NotificationType.info:
    default:
      isSameUser = false;
  }

  if (AppConst.isWeb) return;

  if (!isSameUser) {
    LocalNotification.showNotification(
      id: notificationId,
      title: remoteMessage.notification?.title,
      body: remoteMessage.notification?.body,
      payLoad: data,
      floatingEnabled: config.get('floatingEnabled') != '0',
      lockScreenVisibility: config.get('onLockScreen') == '1',
      makeSilent: config.get('makeSilent') == '1',
      vibrationEnabled: config.get('vibrationEnabled') == '1',
    );
  }
}

bool handleNotificationInApp(
  int notificationId,
  bool appIsOpened,
  ActivityModel activity,
  int screen,
) {
  if (appIsOpened) {
    ProviderDependency.userHome.updateLastActivityUI(activity, screen);

    // * for show notifications in screen
    if (isNotificationScreenOpened) {
      ProviderDependency.userNotification.insertNew(
        activity,
        screen,
        notificationId,
      );
    }

    // * for cancel notifications
    if (!isGroupScreenOpened) return false;
    final GroupCubit c = ProviderDependency.group;
    return c.group.groupId == activity.groupId && screen == c.currentScreen;
  }
  return false;
}
