import '../entities/group_notification_entity.dart';

abstract class NotificationRepositories {
  const NotificationRepositories();

  List<GroupNotificationEntity> getNotifications();

  Future<void> makeSeenToNotification(int notificationId);
}
