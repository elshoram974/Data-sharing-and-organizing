import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:hive/hive.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/group_home_entity.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();
  List<GroupHomeEntity> getAllGroups();
  Future<int> removeAllGroups();
  Future<List<GroupHomeEntity>> saveGroups(
      List<GroupHomeEntity> newGroups, AuthUserEntity userToReplace);
  Future<int> removeSomeGroups(List<GroupHomeEntity> removedGroups);
  Future<Iterable<int>> markAsUnRead(List<GroupHomeEntity> groupsToEdit);
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  HomeLocalDataSourceImp();
  late final Box<GroupHomeEntity> groupsBox =
      Hive.box<GroupHomeEntity>(AppStrings.groupsBox);

  @override
  List<GroupHomeEntity> getAllGroups() {
    return groupsBox.values.toList();
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
        if (ng.id == g.id) {
          groups.add(
            ng.copyWith(
              isMute: g.isMute,
              unReadCounter: g.unReadCounter,
            ),
          );
        }
      }
      if (!groups.any((g) => ng.id == g.id)) groups.add(ng);
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
}
