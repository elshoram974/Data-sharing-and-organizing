import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/chat/data/models/member_model.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hive/hive.dart';

import '../../../../../core/utils/enums/message_type/message_type.dart';
import '../../../../../core/utils/enums/user_role/user_type_enum.dart';
import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../../domain/entities/data_in_directory.dart';
import '../../../domain/entities/directory_entity.dart';
import '../../../domain/entities/member_entity.dart';
import '../../models/attachment_model.dart';

abstract class BOTLocalDataSource {
  const BOTLocalDataSource();

  DataInDirectory getDirActInside(int? dirId, int groupId,[bool saveWithIt = true]);

  Future<void> saveDirActInside(DataInDirectory dataInDirectory);

  Future<void> saveBotMessages(GroupHomeEntity group, List<types.Message> messages);
  List<types.Message> getBotMessages(int groupId);

  Future<void> approveActivity(ActivityEntity activity, bool makeApproved);
  Future<void> deleteActivity(ActivityEntity activity);

  Future<void> approveDirectory(DirectoryEntity dir, bool makeApproved);
  Future<void> deleteDirectory(DirectoryEntity dir);
}

class BOTLocalDataSourceImp extends BOTLocalDataSource {
  BOTLocalDataSourceImp(this.homeLocal);
  final HomeLocalDataSource homeLocal;

  late final Box<String> messageBox = Hive.box<String>(AppStrings.botMessagesBox);
  late final Box<ActivityEntity> activitiesBox = Hive.box<ActivityEntity>(AppStrings.activitiesBox);
  late final Box<DirectoryEntity> directoriesBox = Hive.box<DirectoryEntity>(AppStrings.directoriesBox);

  // * get Directories and activities ------------------------------
  Iterable<ActivityEntity> _allGroupActivities(int groupId) {
    return activitiesBox.values.where((e) => e.groupId == groupId);
  }

  Iterable<DirectoryEntity> _allGroupDirectories(int groupId) {
    return directoriesBox.values.where((e) => e.groupId == groupId);
  }

  @override
  DataInDirectory getDirActInside(int? dirId, int groupId,[bool saveWithIt = true]) {
    final DataInDirectory dir = DataInDirectory(
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
    if (saveWithIt) {
      if (dir.activities.isEmpty) {
        final DataInDirectory actDir = DataInDirectory(
          directories: dir.directories,
          activities: _activities
              .where(
                (e) => e.groupId == groupId && e.insideDirectoryId == dirId,
              )
              .toList(),
          groupId: groupId,
          insideDirectoryId: dirId,
        );
        saveDirActInside(actDir);
        return actDir;
      } else if (dir.directories.isEmpty) {
        final DataInDirectory actDir = DataInDirectory(
          directories: _directories
              .where(
                  (e) => e.groupId == groupId && e.insideDirectoryId == dirId)
              .toList(),
          activities: dir.activities,
          groupId: groupId,
          insideDirectoryId: dirId,
        );
        saveDirActInside(actDir);
        return actDir;
      }
    }
    return dir;
    // TODO: cancel all before this and add the next
    // return DataInDirectory(
    //   groupId: groupId,
    //   insideDirectoryId: dirId,
    //   directories: _allGroupDirectories(groupId)
    //       .where((e) => e.insideDirectoryId == dirId)
    //       .toList(),
    //   activities: _allGroupActivities(groupId)
    //       .where((e) => e.insideDirectoryId == dirId)
    //       .toList()
    //     ..sort((a, b) => a.createdAt.compareTo(b.createdAt)),
    // );
  }
  // ----------------------------------------------------------------

  // * save Directories and activities ------------------------------
  Future<void> _saveGroupActivities(DataInDirectory data) async {
    final DataInDirectory getDirAct = getDirActInside(data.insideDirectoryId, data.groupId, false);
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
    final DataInDirectory getDirAct = getDirActInside(data.insideDirectoryId, data.groupId, false);
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
  Future<void> saveBotMessages(GroupHomeEntity group, List<types.Message> messages) async {
    await messageBox.delete(group.id);

    ProviderDependency.userHome.updateGroupLocally(
      group.copyWithNull(
        id: group.id,
        imageLink: group.imageLink,
        groupName: group.groupName,
        lastActivity: ActivityEntity.fromMessage(messages.first),
        unReadCounter: null,
        isSelected: group.isSelected,
        isMute: group.isMute,
        ownerId: group.ownerId,
        bottomHeight: group.bottomHeight,
        discussion: group.discussion,
        accessType: group.accessType,
        member: MemberModel.fromEntity(group.memberEntity),
        createdAt: group.createdAt,
      ),
    );

    List<String> json = [];
    for (types.Message e in messages) {
      json.add(jsonEncode(e.toJson()));
    }

    return await messageBox.put(group.id, jsonEncode(json));
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
  Future<void> approveActivity(ActivityEntity activity, bool makeApproved) async{
    final Iterable<ActivityEntity> oldActivities = activitiesBox.values;
    final List<ActivityEntity> activitiesToSave = [];

    for (ActivityEntity a in oldActivities) {
      if(a.id == activity.id){
        activitiesToSave.add(a.copyWith(isApproved: makeApproved));
      }else{
        activitiesToSave.add(a);
      }
    }

    await activitiesBox.clear();
    await activitiesBox.addAll(activitiesToSave);
  }
  
  @override
  Future<void> deleteActivity(ActivityEntity activity) async{
    final List<ActivityEntity> activitiesToSave = [];
    activitiesToSave.addAll(activitiesBox.values);

    activitiesToSave.removeWhere((a) => a.id == activity.id);

    await activitiesBox.clear();
    await activitiesBox.addAll(activitiesToSave);
  }
  
  @override
  Future<void> approveDirectory(DirectoryEntity dir, bool makeApproved) async{
    final Iterable<DirectoryEntity> oldDirectories = directoriesBox.values;
    final List<DirectoryEntity> directoriesToSave = [];

    for (DirectoryEntity a in oldDirectories) {
      if(a.id == dir.id){
        directoriesToSave.add(a.copyWith(isApproved: makeApproved));
      }else{
        directoriesToSave.add(a);
      }
    }

    await directoriesBox.clear();
    await directoriesBox.addAll(directoriesToSave);
  }
  
  @override
  Future<void> deleteDirectory(DirectoryEntity dir) async{
    final List<DirectoryEntity> directoriesToSave = [];
    directoriesToSave.addAll(directoriesBox.values);

    directoriesToSave.removeWhere((a) => a.id == dir.id);

    await directoriesBox.clear();
    await directoriesBox.addAll(directoriesToSave);
  }
}

AuthUserEntity _me = const AuthUserEntity(
  id: 42,
  name: 'Mohammed El Shora',
  email: 'elshoram974@gmail.com',
  password: '',
  userType: UserType.personal,
);

MemberEntity member = MemberEntity(
  user: _me,
  groupId: 5,
  canInteract: true,
  joinDate: DateTime(2001),
  isAdmin: true,
);

List<ActivityEntity> _activities = [
  ActivityEntity(
    id: 455,
    groupId: 5,
    content: "1 Test To approve it google.com",
    createdBy: member,
    createdAt: DateTime(2015),
    isApproved: false,
    type: MessageType.textMessage,
  ),
  ActivityEntity(
    id: 55,
    groupId: 5,
    content: "3 Test To approve it file",
    createdBy: member,
    createdAt: DateTime.now(),
    isApproved: true,
    attachment: const AttachmentModel(
      size: 50000,
      width: 3,
      height: 4,
      name: 'File name',
      uri:
          'https://pbs.twimg.com/profile_images/1744393322418802688/-ZF7VwbA_400x400.jpg',
      mimeType: 'image/jpeg',
    ),
    type: MessageType.other,
  ),
  ActivityEntity(
    id: 56,
    groupId: 5,
    content: "2 Test To approve it image",
    createdBy: member,
    createdAt: DateTime(2024),
    isApproved: true,
    attachment: const AttachmentModel(
      size: 50000,
      width: 3,
      height: 4,
      name: 'image name',
      uri:
          'https://pbs.twimg.com/profile_images/1744393322418802688/-ZF7VwbA_400x400.jpg',
    ),
    type: MessageType.photo,
  ),
  ActivityEntity(
    id: 1,
    groupId: 5,
    content: "3 4 Hi to BOT .. You can ask me",
    createdBy: member,
    createdAt: DateTime.now(),
    isApproved: false,
    type: MessageType.textMessage,
  ),
  ActivityEntity(
    id: 2,
    groupId: 5,
    insideDirectoryId: 14,
    content: "بداخل اخلاقيات ككل",
    createdBy: member,
    createdAt: DateTime.now(),
    isApproved: true,
    type: MessageType.textMessage,
  ),
  ActivityEntity(
    id: 3,
    groupId: 5,
    insideDirectoryId: 11,
    content: "AdvancedProgramming subject",
    createdBy: member,
    createdAt: DateTime.now(),
    isApproved: true,
    type: MessageType.textMessage,
  ),
  ActivityEntity(
    id: 4,
    groupId: 5,
    insideDirectoryId: 11,
    content: "AdvancedProgramming \nU can choose what u want",
    createdBy: member,
    createdAt: DateTime.now(),
    isApproved: true,
    type: MessageType.textMessage,
  ),
  ActivityEntity(
    id: 4,
    groupId: 5,
    insideDirectoryId: 11,
    content: "AdvancedProgramming \nU can choose what u want\nagain",
    createdBy: member,
    createdAt: DateTime.now(),
    isApproved: false,
    type: MessageType.textMessage,
  ),
];

List<DirectoryEntity> _directories = [
  DirectoryEntity(
    id: 9,
    name: 'مش معايا',
    groupId: 1,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 10,
    name: 'مش معايا',
    groupId: 1,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 11,
    name: 'AdvancedProgramming',
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 12,
    name: 'AI',
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 13,
    name: 'Embedded system',
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 14,
    name: 'أخلاقيات المهنة',
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 15,
    name: 'إدارة مشروعات',
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 16,
    name: 'مهارات البحث والتحليل',
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 17,
    name: 'Advanced Data',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 18,
    name: 'Advanced Sheets',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 19,
    name: 'Advanced Exams',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 20,
    name: 'Advanced Records',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 21,
    name: 'Advanced Other',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 22,
    name: 'Advanced Lectures',
    insideDirectoryId: 17,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 23,
    name: 'Advanced Sections',
    insideDirectoryId: 17,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 24,
    name: 'أخلاقيات بيانات',
    insideDirectoryId: 14,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 25,
    name: 'أخلاقيات امتحانات',
    insideDirectoryId: 14,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 26,
    name: 'أخلاقيات اخرى',
    insideDirectoryId: 14,
    groupId: 5,
    createdBy: member.copyWith(
      user: const AuthUserEntity(
        id: 45,
        name: 'MRE CODE',
        email: 'mre9743@gmail.com',
        password: '',
        userType: UserType.personal,
      ),
    ),
  ),
  DirectoryEntity(
    id: 27,
    name: 'AI Data',
    insideDirectoryId: 12,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 28,
    name: 'AI sheets',
    insideDirectoryId: 12,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 29,
    name: 'AI Exams',
    insideDirectoryId: 12,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 30,
    name: 'أخلاقيات ميدتيرم',
    insideDirectoryId: 25,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
  DirectoryEntity(
    id: 31,
    name: 'Ai sheets lec',
    insideDirectoryId: 28,
    groupId: 5,
    isApproved: true,
    createdBy: member,
  ),
];
