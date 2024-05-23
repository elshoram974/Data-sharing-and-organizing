import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive/hive.dart';

import '../../../../chat/data/models/activity_model.dart';
import '../../../domain/entities/group_home_entity.dart';
import '../../../domain/entities/group_notification_entity.dart';

abstract class NotificationLocalDataSource {
  const NotificationLocalDataSource();

  List<GroupNotificationEntity> getNotifications();

  Future<void> saveNotification({
    required int notificationId,
    required int screen,
    required int groupId,
    required ActivityModel activity,
  });

  Future<void> makeSeenToGroupNotifications(int groupId);

  Future<void> makeSeenToNotification(int id);

  Future<int> addNotifications(GroupNotificationEntity notification);
}

class NotificationLocalDataSourceImp extends NotificationLocalDataSource {
  NotificationLocalDataSourceImp();

  late final Box<GroupNotificationEntity> notificationBox =
      Hive.box<GroupNotificationEntity>(AppStrings.notificationBox);

  @override
  List<GroupNotificationEntity> getNotifications() {
    final Iterable<GroupNotificationEntity> notificationList =
        notificationBox.values;
    final List<GroupNotificationEntity> temp = [];
    final Box<GroupHomeEntity> groups = Hive.box(AppStrings.groupsBox);
    for (GroupHomeEntity e in groups.values) {
      temp.addAll(
        notificationList.where((element) => e.groupId == element.groupId),
      );
    }
    return temp.reversed.toList();
  }

  @override
  Future<void> saveNotification({
    required int notificationId,
    required int screen,
    required int groupId,
    required ActivityModel activity,
  }) async {
    final Box<GroupHomeEntity> groups = Hive.box(AppStrings.groupsBox);
    final GroupHomeEntity g =
        groups.values.where((e) => e.groupId == groupId).first;
    await addNotifications(
      GroupNotificationEntity(
        groupId: groupId,
        notificationId: notificationId,
        groupName: g.groupName,
        ownerId: g.ownerId,
        discussion: g.discussion,
        memberEntity: g.memberEntity,
        createdAt: g.createdAt,
        imageLink: g.imageLink,
        lastActivity: activity.copyWith(groupId: groupId),
        screen: screen,
        bottomHeight: g.bottomHeight,
        accessType: g.accessType,
        unReadCounter: 1,
      ),
    );
  }

  @override
  Future<void> makeSeenToNotification(int id) async {
    final List<GroupNotificationEntity> temp = notificationBox.values.toList();
    final int i = temp.indexWhere((e) => e.notificationId == id);

    temp[i] = GroupNotificationEntity(
      notificationId: temp[i].notificationId,
      groupId: temp[i].groupId,
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

    await notificationBox.clear();
    await notificationBox.addAll(temp);
  }

  @override
  Future<int> addNotifications(GroupNotificationEntity notification) {
    return notificationBox.add(notification);
  }

  @override
  Future<void> makeSeenToGroupNotifications(int groupId) async {
    final List<GroupNotificationEntity> temp = notificationBox.values.toList();
    for (int i = 0; i < temp.length; i++) {
      if (temp[i].groupId == groupId) {
        temp[i] = GroupNotificationEntity(
          notificationId: temp[i].notificationId,
          groupId: temp[i].groupId,
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
    await notificationBox.addAll(temp);
  }
}
