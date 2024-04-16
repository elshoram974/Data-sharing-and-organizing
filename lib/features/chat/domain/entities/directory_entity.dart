import 'package:equatable/equatable.dart';

class DirectoryEntity extends Equatable {
  const DirectoryEntity({
    required this.id,
    required this.createdById,
    required this.name,
    required this.insideDirectoryId,
    required this.groupId,
    this.isAccepted = false,
  });
  final int id;
  final int createdById;
  final int groupId;
  final String name;
  final int insideDirectoryId;
  final bool isAccepted;

  factory DirectoryEntity.newEmpty() {
    return const DirectoryEntity(
      id: -1,
      createdById: -1,
      name: '',
      insideDirectoryId: 0,
      groupId: -1,
    );
  }

  @override
  List<Object?> get props => [id, name, insideDirectoryId];
}

List<DirectoryEntity> directories = [
  const DirectoryEntity(
    id: 9,
    createdById: 42,
    name: 'مش معايا',
    insideDirectoryId: 0,
    groupId: 1,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 10,
    createdById: 42,
    name: 'مش معايا',
    insideDirectoryId: 0,
    groupId: 1,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 11,
    createdById: 42,
    name: 'AdvancedProgramming',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 12,
    createdById: 42,
    name: 'AI',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 13,
    createdById: 42,
    name: 'Embedded system',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 14,
    createdById: 42,
    name: 'أخلاقيات المهنة',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 15,
    createdById: 42,
    name: 'إدارة مشروعات',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 16,
    createdById: 42,
    name: 'مهارات البحث والتحليل',
    insideDirectoryId: 0,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 17,
    createdById: 42,
    name: 'Advanced Data',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 18,
    createdById: 42,
    name: 'Advanced Sheets',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 19,
    createdById: 42,
    name: 'Advanced Exams',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 20,
    createdById: 42,
    name: 'Advanced Records',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 21,
    createdById: 42,
    name: 'Advanced Other',
    insideDirectoryId: 11,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 22,
    createdById: 42,
    name: 'Advanced Lectures',
    insideDirectoryId: 17,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 23,
    createdById: 42,
    name: 'Advanced Sections',
    insideDirectoryId: 17,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 24,
    createdById: 42,
    name: 'أخلاقيات بيانات',
    insideDirectoryId: 14,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 25,
    createdById: 42,
    name: 'أخلاقيات امتحانات',
    insideDirectoryId: 14,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
      id: 26,
      createdById: 45,
      name: 'أخلاقيات اخرى',
      insideDirectoryId: 14,
      groupId: 5),
  const DirectoryEntity(
    id: 27,
    createdById: 42,
    name: 'AI Data',
    insideDirectoryId: 12,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 28,
    createdById: 42,
    name: 'AI sheets',
    insideDirectoryId: 12,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 29,
    createdById: 42,
    name: 'AI Exams',
    insideDirectoryId: 12,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 30,
    createdById: 42,
    name: 'أخلاقيات ميدتيرم',
    insideDirectoryId: 25,
    groupId: 5,
    isAccepted: true,
  ),
  const DirectoryEntity(
    id: 31,
    createdById: 42,
    name: 'Ai sheets lec',
    insideDirectoryId: 28,
    groupId: 5,
    isAccepted: true,
  ),
];
