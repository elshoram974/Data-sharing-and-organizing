import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/group_home_entity.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();
  List<GroupHomeEntity> getAllGroups();
  Future<int> removeAllGroups();
  Future<Iterable<int>> saveGroups(List<GroupHomeEntity> newGroups);
  Future<int> removeSomeGroups(List<GroupHomeEntity> removedGroups);
  List<GroupHomeEntity> getSavedGroupsPerPage(int page, int pageSize);
  Future<Iterable<int>> markAsUnRead(List<GroupHomeEntity> groupsToEdit);
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  HomeLocalDataSourceImp();
  late final Box<GroupHomeEntity> groupsBox = Hive.box<GroupHomeEntity>(AppStrings.groupsBox);

  @override
  List<GroupHomeEntity> getAllGroups() => groupsBox.values.toList();

  @override
  Future<int> removeAllGroups() {
    return groupsBox.isNotEmpty ? groupsBox.clear() : Future.value(1);
  }

  @override
  Future<Iterable<int>> saveGroups(List<GroupHomeEntity> newGroups) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());
    for (final GroupHomeEntity e in newGroups) {
      if (groups.contains(e)) groups.remove(e);
      groups.insert(0, e);
    }
    await removeAllGroups();
    return await groupsBox.addAll(groups);
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
  List<GroupHomeEntity> getSavedGroupsPerPage(int page, int pageSize) {
    int startIndex = (page - 1) * pageSize;
    return getAllGroups().skip(startIndex).take(pageSize).toList();
  }

  @override
  Future<Iterable<int>> markAsUnRead(List<GroupHomeEntity> groupsToEdit) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groupsToEdit.contains(groups[i])) {
        groups[i] = groups[i].copyWith(isUnread: true);
      }
    }

    await removeAllGroups();
    return await groupsBox.addAll(groups);
  }
}
