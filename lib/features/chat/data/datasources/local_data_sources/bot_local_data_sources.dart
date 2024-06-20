import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/chat/data/models/member_model.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hive/hive.dart';

import '../../../../user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../../domain/entities/data_in_directory.dart';
import '../../../domain/entities/directory_entity.dart';

abstract class BOTLocalDataSource {
  const BOTLocalDataSource();

  DataInDirectory getDirActInside(int? dirId, int groupId,
      [bool saveWithIt = true]);

  Future<void> saveDirActInside(DataInDirectory dataInDirectory);

  Future<void> saveBotMessages(
      GroupHomeEntity group, List<types.Message> messages);
  List<types.Message> getBotMessages(int groupId);

  Future<void> approveActivity(ActivityEntity activity, bool makeApproved);
  Future<void> deleteActivity(ActivityEntity activity);

  Future<void> approveDirectory(DirectoryEntity dir, bool makeApproved);
  Future<void> deleteDirectory(DirectoryEntity dir);
}

class BOTLocalDataSourceImp extends BOTLocalDataSource {
  BOTLocalDataSourceImp(this.homeLocal);
  final HomeLocalDataSource homeLocal;

  late final Box<String> messageBox =
      Hive.box<String>(AppStrings.botMessagesBox);
  late final Box<ActivityEntity> activitiesBox =
      Hive.box<ActivityEntity>(AppStrings.activitiesBox);
  late final Box<DirectoryEntity> directoriesBox =
      Hive.box<DirectoryEntity>(AppStrings.directoriesBox);

  // * get Directories and activities ------------------------------
  Iterable<ActivityEntity> _allGroupActivities(int groupId) {
    return activitiesBox.values.where((e) => e.groupId == groupId);
  }

  Iterable<DirectoryEntity> _allGroupDirectories(int groupId) {
    return directoriesBox.values.where((e) => e.groupId == groupId);
  }

  @override
  DataInDirectory getDirActInside(int? dirId, int groupId,
      [bool saveWithIt = true]) {
    return DataInDirectory(
      groupId: groupId,
      insideDirectoryId: dirId,
      directories: _allGroupDirectories(groupId)
          .where((e) => e.insideDirectoryId == dirId)
          .toList(),
      activities: _allGroupActivities(groupId)
          .where((e) => e.insideDirectoryId == dirId)
          .toList()
        ..sort((a, b) => a.createdAt.compareTo(b.createdAt)),
    );
  }
  // ----------------------------------------------------------------

  // * save Directories and activities ------------------------------
  Future<void> _saveGroupActivities(DataInDirectory data) async {
    final DataInDirectory getDirAct =
        getDirActInside(data.insideDirectoryId, data.groupId, false);
    final List<ActivityEntity> oldActivitiesInSide = getDirAct.activities;

    final List<ActivityEntity> activitiesToSave = [];

    activitiesToSave.addAll(activitiesBox.values);

    if (oldActivitiesInSide.isEmpty) {
      for (ActivityEntity newAct in data.activities) {
        activitiesToSave.removeWhere((e) => e.id == newAct.id);
      }
    } else {
      for (ActivityEntity oldActivityInSide in oldActivitiesInSide) {
        activitiesToSave.removeWhere((e) => e.id == oldActivityInSide.id);
      }
    }

    activitiesToSave.addAll(data.activities);

    await activitiesBox.clear();
    await activitiesBox.addAll(activitiesToSave);
  }

  Future<void> _saveGroupDirectories(DataInDirectory data) async {
    final DataInDirectory getDirAct =
        getDirActInside(data.insideDirectoryId, data.groupId, false);
    final List<DirectoryEntity> oldDirInSide = getDirAct.directories;

    final List<DirectoryEntity> directoriesToSave = [];

    directoriesToSave.addAll(directoriesBox.values);

    if (oldDirInSide.isEmpty) {
      for (DirectoryEntity newDir in data.directories) {
        directoriesToSave.removeWhere((e) => e.id == newDir.id);
      }
    } else {
      for (DirectoryEntity dirInSide in oldDirInSide) {
        directoriesToSave.removeWhere((e) => e.id == dirInSide.id);
      }
    }

    directoriesToSave.addAll(data.directories);

    await directoriesBox.clear();
    await directoriesBox.addAll(directoriesToSave);
  }

  @override
  Future<void> saveDirActInside(DataInDirectory dataInDirectory) {
    return Future.wait([
      _saveGroupActivities(dataInDirectory),
      _saveGroupDirectories(dataInDirectory),
    ]);
  }
  // ----------------------------------------------------------------

  @override
  Future<void> saveBotMessages(
    GroupHomeEntity group,
    List<types.Message> messages,
  ) async {
    await messageBox.delete(group.groupId);

    ProviderDependency.userHome.updateGroupLocally(
      group.copyWithNull(
        id: group.groupId,
        imageLink: group.imageLink,
        groupName: group.groupName,
        lastActivity: ActivityEntity.fromMessage(messages.first),
        unReadCounter: null,
        isSelected: group.isSelected,
        ownerId: group.ownerId,
        bottomHeight: group.bottomHeight,
        discussion: group.discussion,
        accessType: group.accessType,
        member: MemberModel.fromEntity(group.memberEntity),
        createdAt: group.createdAt,
        screen: group.screen,
        status: group.status,
        statusMessage: group.statusMessage,
      ),
    );

    List<String> json = [];
    for (types.Message e in messages) {
      json.add(jsonEncode(e.toJson()));
    }

    return await messageBox.put(group.groupId, jsonEncode(json));
  }

  @override
  List<types.Message> getBotMessages(int groupId) {
    final String? json = messageBox.get(groupId);
    if (json == null) return [];
    final List<types.Message> messages = [];
    List<dynamic> jsonList = jsonDecode(json);
    for (final String j in jsonList) {
      messages.add(types.Message.fromJson(jsonDecode(j)));
    }

    return messages;
  }

  @override
  Future<void> approveActivity(
      ActivityEntity activity, bool makeApproved) async {
    final Iterable<ActivityEntity> oldActivities = activitiesBox.values;
    final List<ActivityEntity> activitiesToSave = [];

    for (ActivityEntity a in oldActivities) {
      if (a.id == activity.id) {
        activitiesToSave.add(a.copyWith(isApproved: makeApproved));
      } else {
        activitiesToSave.add(a);
      }
    }

    await activitiesBox.clear();
    await activitiesBox.addAll(activitiesToSave);
  }

  @override
  Future<void> deleteActivity(ActivityEntity activity) async {
    final List<ActivityEntity> activitiesToSave = [];
    activitiesToSave.addAll(activitiesBox.values);

    activitiesToSave.removeWhere((a) => a.id == activity.id);

    await activitiesBox.clear();
    await activitiesBox.addAll(activitiesToSave);
  }

  @override
  Future<void> approveDirectory(DirectoryEntity dir, bool makeApproved) async {
    final Iterable<DirectoryEntity> oldDirectories = directoriesBox.values;
    final List<DirectoryEntity> directoriesToSave = [];

    for (DirectoryEntity a in oldDirectories) {
      if (a.id == dir.id) {
        directoriesToSave.add(a.copyWith(isApproved: makeApproved));
      } else {
        directoriesToSave.add(a);
      }
    }

    await directoriesBox.clear();
    await directoriesBox.addAll(directoriesToSave);
  }

  Future<void> _deleteActivitiesInside(int? inside) async {
    final List<ActivityEntity> activitiesToSave = [];
    activitiesToSave.addAll(activitiesBox.values);

    activitiesToSave.removeWhere((a) => a.insideDirectoryId == inside);

    await activitiesBox.clear();
    await activitiesBox.addAll(activitiesToSave);
  }

  Future<void> _deleteDirectoriesInside(int? inside) async {
    final Iterable<DirectoryEntity> directories = directoriesBox.values;
    for (DirectoryEntity d in directories) {
      if (d.insideDirectoryId == inside) await deleteDirectory(d);
    }
  }

  @override
  Future<void> deleteDirectory(DirectoryEntity dir) async {
    final List<DirectoryEntity> directoriesToSave = [];
    directoriesToSave.addAll(directoriesBox.values);

    await _deleteActivitiesInside(dir.id);
    await _deleteDirectoriesInside(dir.id);

    directoriesToSave.removeWhere((a) => a.id == dir.id);

    await directoriesBox.clear();
    await directoriesBox.addAll(directoriesToSave);
  }
}
