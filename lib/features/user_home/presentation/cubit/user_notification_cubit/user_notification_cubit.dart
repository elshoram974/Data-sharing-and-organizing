import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../chat/domain/entities/activity_entity.dart';
import '../../../domain/entities/group_home_entity.dart';
import '../../../domain/entities/group_notification_entity.dart';
import '../../../domain/repositories/notification_repositories.dart';

part 'user_notification_state.dart';

bool isNotificationScreenOpened = false;

class UserNotificationCubit extends Cubit<UserNotificationState> {
  final NotificationRepositories repo;
  UserNotificationCubit(this.repo) : super(const UserNotificationInitial()) {
    currentNotifications.addAll(repo.getNotifications());
    isNotificationScreenOpened = true;
  }
  final List<GroupNotificationEntity> currentNotifications = [];

  void onPressExpanded(GroupNotificationEntity notification, int i) async {
    GroupNotificationEntity replaced = GroupNotificationEntity(
      notificationId: notification.notificationId,
      groupId: notification.groupId,
      groupName: notification.groupName,
      ownerId: notification.ownerId,
      discussion: notification.discussion,
      memberEntity: notification.memberEntity,
      createdAt: notification.createdAt,
      accessType: notification.accessType,
      bottomHeight: notification.bottomHeight,
      imageLink: notification.imageLink,
      isExpanded: !notification.isExpanded,
      lastActivity: notification.lastActivity,
      screen: notification.screen,
      unReadCounter: null,
    );

    await repo.makeSeenToNotification(replaced.notificationId);

    currentNotifications[i] = replaced;
    emit(UpdateNotificationState(currentNotifications[i], i));
  }

  void insertNew(ActivityEntity activity, int screen, int notificationId) {
    final groups = ProviderDependency.userHome.currentGroups;
    final GroupHomeEntity g =
        groups.where((e) => e.groupId == activity.groupId).first;
    currentNotifications.insert(
      0,
      GroupNotificationEntity(
        notificationId: notificationId,
        groupId: g.groupId,
        groupName: g.groupName,
        ownerId: g.ownerId,
        discussion: g.discussion,
        memberEntity: g.memberEntity,
        createdAt: g.createdAt,
        accessType: g.accessType,
        bottomHeight: g.bottomHeight,
        imageLink: g.imageLink,
        lastActivity: activity,
        screen: screen,
        unReadCounter: 1,
      ),
    );
    emit(UpdateNotificationState(currentNotifications[0], 0));
  }

  @override
  Future<void> close() {
    isNotificationScreenOpened = false;
    return super.close();
  }

  int _i = 0;
  void updateUI() {
    currentNotifications.clear();
    currentNotifications.addAll(repo.getNotifications());
    emit(UpdateUI(_i++));
  }
}
