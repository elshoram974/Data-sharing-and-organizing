import 'package:data_sharing_organizing/core/status/status.dart';

import '../entities/group_notification_entity.dart';

abstract class NotificationRepositories {
  Status<List<GroupNotificationEntity>> getNotifications();
  Future<Status<GroupNotificationEntity>> updateNotifications(
    GroupNotificationEntity notification,
  );
}
