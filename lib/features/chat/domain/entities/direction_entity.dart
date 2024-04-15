import 'package:equatable/equatable.dart';

class DirectionEntity extends Equatable {
  const DirectionEntity({
    required this.id,
    required this.createdById,
    required this.name,
    required this.insideDirectionId,
    required this.groupId,
    this.isAccepted = false,
  });
  final int id;
  final int createdById;
  final int groupId;
  final String name;
  final int insideDirectionId;
  final bool isAccepted;

  factory DirectionEntity.newEmpty() {
    return const DirectionEntity(
      id: -1,
      createdById:-1,
      name: '',
      insideDirectionId: 0,
      groupId: -1,
    );
  }

  @override
  List<Object?> get props => [id, name, insideDirectionId];
}

List<DirectionEntity> directions = [
  const DirectionEntity(id: 9, createdById:42, name: 'مش معايا', insideDirectionId: 0, groupId: 1,isAccepted:true),
  const DirectionEntity(id: 10, createdById:42, name: 'مش معايا', insideDirectionId: 0, groupId: 1,isAccepted:true),
  const DirectionEntity(id: 11, createdById:42, name: 'AdvancedProgramming', insideDirectionId: 0, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 12, createdById:42, name: 'AI', insideDirectionId: 0, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 13, createdById:42, name: 'Embedded system', insideDirectionId: 0, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 14, createdById:42, name: 'أخلاقيات المهنة', insideDirectionId: 0, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 15, createdById:42, name: 'إدارة مشروعات', insideDirectionId: 0, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 16, createdById:42, name: 'مهارات البحث والتحليل', insideDirectionId: 0, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 17, createdById:42, name: 'Advanced Data', insideDirectionId: 11, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 18, createdById:42, name: 'Advanced Sheets', insideDirectionId: 11, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 19, createdById:42, name: 'Advanced Exams', insideDirectionId: 11, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 20, createdById:42, name: 'Advanced Records', insideDirectionId: 11, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 21, createdById:42, name: 'Advanced Other', insideDirectionId: 11, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 22, createdById:42, name: 'Advanced Lectures', insideDirectionId: 17, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 23, createdById:42, name: 'Advanced Sections', insideDirectionId: 17, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 24, createdById:42, name: 'أخلاقيات بيانات', insideDirectionId: 14, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 25, createdById:42, name: 'أخلاقيات امتحانات', insideDirectionId: 14, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 26, createdById:45, name: 'أخلاقيات اخرى', insideDirectionId: 14, groupId: 5),
  const DirectionEntity(id: 27, createdById:42, name: 'AI Data', insideDirectionId: 12, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 28, createdById:42, name: 'AI sheets', insideDirectionId: 12, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 29, createdById:42, name: 'AI Exams', insideDirectionId: 12, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 30, createdById:42, name: 'أخلاقيات ميدتيرم', insideDirectionId: 25, groupId: 5,isAccepted:true),
  const DirectionEntity(id: 31, createdById:42, name: 'Ai sheets lec', insideDirectionId: 28, groupId: 5,isAccepted:true),
];
