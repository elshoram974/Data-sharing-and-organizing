import 'package:data_sharing_organizing/core/status/status.dart';

import '../../domain/entities/group_notification_entity.dart';
import '../../domain/repositories/notification_repositories.dart';

class NotificationRepositoriesImp extends NotificationRepositories {
  @override
  Status<List<GroupNotificationEntity>> getNotifications() {
    // TODO: implement getNotifications
    throw UnimplementedError();
  }

  @override
  Future<Status<GroupNotificationEntity>> updateNotifications(GroupNotificationEntity notification) {
    // TODO: implement updateNotifications
    throw UnimplementedError();
  }

}
