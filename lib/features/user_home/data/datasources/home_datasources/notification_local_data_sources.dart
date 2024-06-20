import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/functions/sort_groups_by_last_activity_time.dart';
import 'package:data_sharing_organizing/core/utils/services/notification/local_notification.dart';
import 'package:hive/hive.dart';

import '../../../../chat/domain/entities/activity_entity.dart';
import '../../../domain/entities/group_home_entity.dart';
import '../../../domain/entities/group_notification_entity.dart';

abstract class NotificationLocalDataSource {
  const NotificationLocalDataSource();

  List<GroupNotificationEntity> getNotifications();

  Future<void> saveNotification({
    required int notificationId,
    required int screen,
    required int groupId,
    required ActivityEntity activity,
  });

  Future<void> makeSeenToGroupNotifications(int groupId);

  Future<void> makeSeenToNotification(int id);

  Future<int> addNotifications(GroupNotificationEntity notification);
  int unreadCount();
  String? getImageURL(int groupId);
}

class NotificationLocalDataSourceImp extends NotificationLocalDataSource {
  NotificationLocalDataSourceImp();

  late final Box<GroupNotificationEntity> notificationBox =
      Hive.box<GroupNotificationEntity>(AppStrings.notificationBox);

  @override
  List<GroupNotificationEntity> getNotifications() {
    LocalNotification.instance.cancelAll();

    final Iterable<GroupNotificationEntity> notificationList =
        notificationBox.values;
    final List<GroupNotificationEntity> temp = [];
    final Box<GroupHomeEntity> groups = Hive.box(AppStrings.groupsBox);
    for (GroupHomeEntity e in groups.values) {
      for (GroupNotificationEntity n in notificationList) {
        if (e.groupId == n.groupId) {
          temp.add(
            GroupNotificationEntity(
              groupId: n.groupId,
              notificationId: n.notificationId,
              ownerId: n.ownerId,
              createdAt: n.createdAt,
              screen: n.screen,
              unReadCounter: n.unReadCounter,
              isExpanded: n.isExpanded,
              lastActivity: n.lastActivity,
              groupName: e.groupName,
              discussion: e.discussion,
              accessType: e.accessType,
              memberEntity: e.memberEntity,
              bottomHeight: e.bottomHeight,
              imageLink: e.imageLink,
              status: e.status,
              statusMessage: e.statusMessage,
            ),
          );
        }
      }
    }
    return temp..sort(compareLastActivity);
  }

  @override
  Future<void> saveNotification({
    required int notificationId,
    required int screen,
    required int groupId,
    required ActivityEntity activity,
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
        status: g.status,
        statusMessage: g.statusMessage,
      ),
    );
  }

  @override
  Future<void> makeSeenToNotification(int id) async {
    final List<GroupNotificationEntity> temp = notificationBox.values.toList();
    final int i = temp.indexWhere((e) => e.notificationId == id);
    await LocalNotification.instance.cancel(id);

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
      status: temp[i].status,
      statusMessage: temp[i].statusMessage,
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
    await LocalNotification.instance.cancelAll();

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
          status: temp[i].status,
          statusMessage: temp[i].statusMessage,
          unReadCounter: null,
        );
      }
    }

    await notificationBox.clear();
    await notificationBox.addAll(temp);
  }

  @override
  int unreadCount() {
    return getNotifications().where((e) => e.unReadCounter != null).length;
  }

  @override
  String? getImageURL(int groupId) {
    return getNotifications()
        .where((e) => e.groupId == groupId)
        .firstOrNull
        ?.imageLink;
  }
}
