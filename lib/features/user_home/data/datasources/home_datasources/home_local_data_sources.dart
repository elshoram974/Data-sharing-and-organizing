import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/sort_groups_by_last_activity_time.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/services/notification/notification_services.dart';
import 'package:hive/hive.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../chat/domain/entities/activity_entity.dart';
import '../../../domain/entities/group_home_entity.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();
  List<GroupHomeEntity> getAllGroups();
  Future<int> removeAllGroups();
  Future<List<GroupHomeEntity>> saveGroups(
      List<GroupHomeEntity> newGroups, AuthUserEntity userToReplace);
  Future<int> removeSomeGroups(List<GroupHomeEntity> removedGroups);
  Future<Iterable<int>> markAsUnRead(List<GroupHomeEntity> groupsToEdit);

  Future<void> updateScreen(int groupId , int screen);
  Future<void> updateThisGroup(GroupHomeEntity groupUpdated);
  Future<void> updateLastActivity(ActivityEntity activity, int screen);
  Future<void> makeSeenToGroup(int groupId);
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  HomeLocalDataSourceImp();
  late final Box<GroupHomeEntity> groupsBox =
      Hive.box<GroupHomeEntity>(AppStrings.groupsBox);

  @override
  List<GroupHomeEntity> getAllGroups() {
    return groupsBox.values.toList()..sort(compareLastActivity);
  }

  @override
  Future<int> removeAllGroups() {
    return groupsBox.isNotEmpty ? groupsBox.clear() : Future.value(1);
  }

  @override
  Future<List<GroupHomeEntity>> saveGroups(
      List<GroupHomeEntity> newGroups, AuthUserEntity userToReplace) async {
    final List<GroupHomeEntity> groups = [];
    final List<GroupHomeEntity> savedGroups = getAllGroups();
    for (final GroupHomeEntity ng in newGroups) {
      for (final GroupHomeEntity g in savedGroups) {
        if (ng.groupId == g.groupId) {
          groups.add(
            ng.copyWith(
              unReadCounter: g.unReadCounter,
              bottomHeight: g.bottomHeight,
              lastActivity: g.lastActivity,
              screen: g.screen,
            ),
          );
        }
      }
      if (!groups.any((g) => ng.groupId == g.groupId)) groups.add(ng);
    }

    await Future.wait([_changeUser(userToReplace), removeAllGroups()]);
    await groupsBox.addAll(groups);

    return groups;
  }

  @override
  Future<int> removeSomeGroups(List<GroupHomeEntity> removedGroups) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());
    groups.removeWhere((e) => removedGroups.contains(e));
    await removeAllGroups();
    await groupsBox.addAll(groups);
    if (!AppConst.isWeb) {
      await Future.wait(
        removedGroups.map(
          (e) => NotificationApi.firebase.unsubscribeFromTopic('${e.groupId}'),
        ),
      );
    }

    return 1;
  }

  @override
  Future<Iterable<int>> markAsUnRead(List<GroupHomeEntity> groupsToEdit) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groupsToEdit.contains(groups[i])) {
        groups[i] = groups[i].copyWith(unReadCounter: 0);
      }
    }

    await removeAllGroups();
    return await groupsBox.addAll(groups);
  }

  Future<AuthUserEntity> _changeUser(AuthUserEntity userToReplace) async {
    final Box<AuthUserEntity> userBox =
        Hive.box<AuthUserEntity>(AppStrings.userBox);
    final AuthUserEntity savedUser = userBox.values.last;
    await Future.wait([
      userBox.clear(),
      if (userToReplace.image != savedUser.image)
        CachedNetworkImage.evictFromCache(savedUser.image ?? ''),
    ]);

    final AuthUserEntity userToSave = userToReplace.copyWith(
      password: savedUser.password,
    );
    ProviderDependency.userMain.user = userToSave;

    await userBox.add(userToSave);
    return userToSave;
  }

  @override
  Future<void> updateThisGroup(GroupHomeEntity groupUpdated) async {
    if (!AppConst.isWeb) {
      switch (groupUpdated.memberEntity.notification) {
        case NotificationEnum.notify:
          NotificationApi.firebase.subscribeToTopic('${groupUpdated.groupId}');
          break;
        default:
          NotificationApi.firebase
              .unsubscribeFromTopic('${groupUpdated.groupId}');
      }
    }
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groupUpdated.groupId == groups[i].groupId) {
        groups[i] = groupUpdated;
        break;
      }
    }

    await removeAllGroups();
    await groupsBox.addAll(groups);
  }

  @override
  Future<void> updateScreen(int groupId , int screen) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groupId == groups[i].groupId) {
        groups[i] = groups[i].copyWith(screen: screen);
        break;
      }
    }

    await removeAllGroups();
    await groupsBox.addAll(groups);
  }

  @override
  Future<void> makeSeenToGroup(int groupId) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groupId == groups[i].groupId) {
        groups[i] = GroupHomeEntity(
          groupId: groups[i].groupId,
          groupName: groups[i].groupName,
          ownerId: groups[i].ownerId,
          discussion: groups[i].discussion,
          memberEntity: groups[i].memberEntity,
          createdAt: groups[i].createdAt,
          accessType: groups[i].accessType,
          bottomHeight: groups[i].bottomHeight,
          imageLink: groups[i].imageLink,
          isSelected: groups[i].isSelected,
          lastActivity: groups[i].lastActivity,
          screen: groups[i].screen,
          unReadCounter: null,
        );
        break;
      }
    }

    await removeAllGroups();
    await groupsBox.addAll(groups);
  }

  @override
  Future<void> updateLastActivity(ActivityEntity activity, int screen) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (activity.groupId == groups[i].groupId) {
        groups[i] = groups[i].copyWith(
          lastActivity: activity,
          screen: screen,
          unReadCounter: (groups[i].unReadCounter ?? 0) + 1,
        );
        break;
      }
    }

    await removeAllGroups();
    await groupsBox.addAll(groups);
  }
}
