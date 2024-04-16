import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';

class DirectoryEntity extends Equatable {
  const DirectoryEntity({
    required this.id,
    required this.name,
    required this.insideDirectoryId,
    required this.groupId,
    required this.createdBy,
    this.isAccepted = false,
  });
  final int id;
  final AuthUserEntity createdBy;
  final int groupId;
  final String name;
  final int insideDirectoryId;
  final bool isAccepted;

  factory DirectoryEntity.newEmpty() {
    return const DirectoryEntity(
      id: -1,
      name: '',
      insideDirectoryId: 0,
      groupId: -1,
      createdBy: AuthUserEntity(
        id: -1,
        name: '',
        email: '',
        password: '',
        userType: UserType.personal,
      ),
    );
  }

  @override
  List<Object?> get props => [id, name, insideDirectoryId];
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
    insideDirectoryId: 0,
    groupId: 1,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 10,
    name: 'مش معايا',
    insideDirectoryId: 0,
    groupId: 1,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 11,
    name: 'AdvancedProgramming',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 12,
    name: 'AI',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 13,
    name: 'Embedded system',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 14,
    name: 'أخلاقيات المهنة',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 15,
    name: 'إدارة مشروعات',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 16,
    name: 'مهارات البحث والتحليل',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 17,
    name: 'Advanced Data',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 18,
    name: 'Advanced Sheets',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 19,
    name: 'Advanced Exams',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 20,
    name: 'Advanced Records',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 21,
    name: 'Advanced Other',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 22,
    name: 'Advanced Lectures',
    insideDirectoryId: 17,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 23,
    name: 'Advanced Sections',
    insideDirectoryId: 17,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 24,
    name: 'أخلاقيات بيانات',
    insideDirectoryId: 14,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 25,
    name: 'أخلاقيات امتحانات',
    insideDirectoryId: 14,
    groupId: 5,
    isAccepted: true,
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
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 28,
    name: 'AI sheets',
    insideDirectoryId: 12,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 29,
    name: 'AI Exams',
    insideDirectoryId: 12,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 30,
    name: 'أخلاقيات ميدتيرم',
    insideDirectoryId: 25,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
  const DirectoryEntity(
    id: 31,
    name: 'Ai sheets lec',
    insideDirectoryId: 28,
    groupId: 5,
    isAccepted: true,
    createdBy: me,
  ),
];
