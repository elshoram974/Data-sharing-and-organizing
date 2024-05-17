import '../entities/group_notification_entity.dart';

abstract class NotificationRepositories {
  const NotificationRepositories();

  List<GroupNotificationEntity> getNotifications();
  Future<GroupNotificationEntity> updateNotifications(
    GroupNotificationEntity notification,
  );
}
