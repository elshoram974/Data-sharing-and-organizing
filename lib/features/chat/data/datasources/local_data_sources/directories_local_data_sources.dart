import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/directory_entity.dart';
import 'package:hive/hive.dart';

import '../../../../../core/utils/enums/user_role/user_type_enum.dart';
import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../user_home/domain/entities/group_home_entity.dart';

abstract class DirectoriesLocalDataSource {
  const DirectoriesLocalDataSource();

  Future<void> saveBottomHeight(double height, int groupId);

  List<DirectoryEntity> getDirectoriesInside(int? dirId, int groupId);

  Future<void> saveDirectories(List<DirectoryEntity> directories);
}

class DirectoriesLocalDataSourceImp extends DirectoriesLocalDataSource {
  DirectoriesLocalDataSourceImp(this.homeLocal);
  final HomeLocalDataSource homeLocal;

  late final Box<GroupHomeEntity> groupsBox =
      Hive.box<GroupHomeEntity>(AppStrings.groupsBox);

  @override
  Future<void> saveBottomHeight(double height, int groupId) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(_getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groups[i].id == groupId) {
        groups[i] = groups[i].copyWith(bottomHeight: height);
        await _removeAllGroups();
        await groupsBox.addAll(groups);
        ProviderDependency.userHome.updateGroupLocally(groups[i]);
        return;
      }
    }
  }

  Iterable<DirectoryEntity> _allGroupDirectories(int groupId) {
    return directories.where((e) => e.groupId == groupId);
  }

  @override
  List<DirectoryEntity> getDirectoriesInside(int? dirId, int groupId) {
    return _allGroupDirectories(groupId)
        .where((e) => e.insideDirectoryId == dirId)
        .toList();
  }

  @override
  Future<void> saveDirectories(List<DirectoryEntity> directories) async {
    // TODO: implement saveDirectories
  }

  // For that i need in home
  List<GroupHomeEntity> _getAllGroups() => homeLocal.getAllGroups();
  Future<int> _removeAllGroups() => homeLocal.removeAllGroups();
}

const AuthUserEntity me = AuthUserEntity(
  id: 42,
  name: 'Mohammed El Shora',
  email: 'elshoram974@gmail.com',
  password: '',
  userType: UserType.personal,
);

List<DirectoryEntity> directories = [
  const DirectoryEntity(
    id: 9,
    name: 'مش معايا',
    groupId: 1,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 10,
    name: 'مش معايا',
    groupId: 1,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 11,
    name: 'AdvancedProgramming',
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 12,
    name: 'AI',
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 13,
    name: 'Embedded system',
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 14,
    name: 'أخلاقيات المهنة',
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 15,
    name: 'إدارة مشروعات',
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 16,
    name: 'مهارات البحث والتحليل',
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 17,
    name: 'Advanced Data',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 18,
    name: 'Advanced Sheets',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 19,
    name: 'Advanced Exams',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 20,
    name: 'Advanced Records',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 21,
    name: 'Advanced Other',
    insideDirectoryId: 11,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 22,
    name: 'Advanced Lectures',
    insideDirectoryId: 17,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 23,
    name: 'Advanced Sections',
    insideDirectoryId: 17,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 24,
    name: 'أخلاقيات بيانات',
    insideDirectoryId: 14,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 25,
    name: 'أخلاقيات امتحانات',
    insideDirectoryId: 14,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 26,
    name: 'أخلاقيات اخرى',
    insideDirectoryId: 14,
    groupId: 5,
    createdBy: AuthUserEntity(
      id: 45,
      name: 'MRE CODE',
      email: 'mre9743@gmail.com',
      password: '',
      userType: UserType.personal,
    ),
  ),
  const DirectoryEntity(
    id: 27,
    name: 'AI Data',
    insideDirectoryId: 12,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 28,
    name: 'AI sheets',
    insideDirectoryId: 12,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 29,
    name: 'AI Exams',
    insideDirectoryId: 12,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 30,
    name: 'أخلاقيات ميدتيرم',
    insideDirectoryId: 25,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 31,
    name: 'Ai sheets lec',
    insideDirectoryId: 28,
    groupId: 5,
    isApproved: true,
    createdBy: me,
  ),
];
