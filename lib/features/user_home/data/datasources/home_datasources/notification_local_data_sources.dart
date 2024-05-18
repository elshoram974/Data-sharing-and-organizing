import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive/hive.dart';

import '../../../../chat/data/models/activity_model.dart';
import '../../../domain/entities/group_home_entity.dart';
import '../../../domain/entities/group_notification_entity.dart';

abstract class NotificationLocalDataSource {
  const NotificationLocalDataSource();

  List<GroupNotificationEntity> getNotifications();

  void saveNotification({
    int? id,
    required int screen,
    required int groupId,
    required ActivityModel activity,
  });

  Future<void> makeSeenToGroup(int groupId);

  Future<GroupNotificationEntity> updateNotifications(
    GroupNotificationEntity notification,
  );

  Future<int> addNotifications(GroupNotificationEntity notification);
}

class NotificationLocalDataSourceImp extends NotificationLocalDataSource {
  NotificationLocalDataSourceImp();

  late final Box<GroupNotificationEntity> notificationBox =
      Hive.box<GroupNotificationEntity>(AppStrings.notificationBox);

  @override
  List<GroupNotificationEntity> getNotifications() {
    return notificationBox.values.toList().reversed.toList();
  }

  @override
  void saveNotification({
    int? id,
    required int screen,
    required int groupId,
    required ActivityModel activity,
  }) {
    final Box<GroupHomeEntity> groups = Hive.box(AppStrings.groupsBox);
    final GroupHomeEntity g = groups.values.where((e) => e.id == groupId).first;
    addNotifications(
      GroupNotificationEntity(
        id: id ?? 0,
        groupName: g.groupName,
        ownerId: g.ownerId,
        discussion: g.discussion,
        memberEntity: g.memberEntity,
        createdAt: g.createdAt,
        imageLink: g.imageLink,
        lastActivity: activity.copyWith(groupId: groupId),
        screen: screen,
        unReadCounter: 1,
      ),
    );
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

  @override
  Future<int> addNotifications(GroupNotificationEntity notification) {
    return notificationBox.add(notification);
  }

  @override
  Future<void> makeSeenToGroup(int groupId) async {
    final List<GroupNotificationEntity> temp = notificationBox.values.toList();
    for (int i = 0; i < temp.length; i++) {
      if (temp[i].lastActivity?.groupId == groupId) {
        temp[i] = GroupNotificationEntity(
          id: temp[i].id,
          groupName: temp[i].groupName,
          ownerId: temp[i].ownerId,
          discussion: temp[i].discussion,
          memberEntity: temp[i].memberEntity,
          createdAt: temp[i].createdAt,
          accessType: temp[i].accessType,
          bottomHeight: temp[i].bottomHeight,
          imageLink: temp[i].imageLink,
          isExpanded: temp[i].isExpanded,
          lastActivity: temp[i].lastActivity,
          screen: temp[i].screen,
          unReadCounter: null,
        );
      }
    }

    await notificationBox.clear();
    notificationBox.addAll(temp);
  }
}
