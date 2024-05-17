import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/group_notification_entity.dart';

abstract class NotificationLocalDataSource {
  const NotificationLocalDataSource();
  List<GroupNotificationEntity> getNotifications();
  Future<GroupNotificationEntity> updateNotifications(
      GroupNotificationEntity notification);
}

class NotificationLocalDataSourceImp extends NotificationLocalDataSource {
  NotificationLocalDataSourceImp();
  late final Box<GroupNotificationEntity> notificationBox =
      Hive.box<GroupNotificationEntity>(AppStrings.notificationBox);

  @override
  List<GroupNotificationEntity> getNotifications() {
    return notificationBox.values.toList();
  }

  @override
  Future<GroupNotificationEntity> updateNotifications(
    GroupNotificationEntity notification,
  ) async {
    final List<GroupNotificationEntity> temp = notificationBox.values.toList();
    final int i = temp.indexWhere(
      (e) => e.lastActivity?.id == notification.lastActivity?.id,
    );

    temp[i] = notification;

    await notificationBox.clear();
    notificationBox.addAll(temp);
    return notification;
  }
}
