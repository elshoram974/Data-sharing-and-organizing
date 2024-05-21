import '../../domain/entities/group_notification_entity.dart';
import '../../domain/repositories/notification_repositories.dart';
import '../datasources/home_datasources/notification_local_data_sources.dart';

class NotificationRepositoriesImp extends NotificationRepositories {
  final NotificationLocalDataSource localDataSource;
  const NotificationRepositoriesImp(this.localDataSource);

  @override
  List<GroupNotificationEntity> getNotifications() {
    return localDataSource.getNotifications();
  }

  @override
  Future<void> makeSeenToNotification(int notificationId) {
    return localDataSource.makeSeenToNotification(notificationId);
  }
}
