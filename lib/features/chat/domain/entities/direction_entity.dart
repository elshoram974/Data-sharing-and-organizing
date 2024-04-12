import 'package:equatable/equatable.dart';

class DirectionEntity extends Equatable {
  const DirectionEntity({
    required this.id,
    required this.name,
    required this.insideDirectionId,
  });
  final int id;
  final String name;
  final int insideDirectionId;

  @override
  List<Object?> get props => [id, name, insideDirectionId];
}

List<DirectionEntity> directions = [
  const DirectionEntity(id: 11, name: 'AdvancedProgramming', insideDirectionId: 0),
  const DirectionEntity(id: 12, name: 'AI', insideDirectionId: 0),
  const DirectionEntity(id: 13, name: 'Embedded system', insideDirectionId: 0),
  const DirectionEntity(id: 14, name: 'أخلاقيات المهنة', insideDirectionId: 0),
  const DirectionEntity(id: 15, name: 'إدارة مشروعات', insideDirectionId: 0),
  const DirectionEntity(id: 16, name: 'مهارات البحث والتحليل', insideDirectionId: 0),
  const DirectionEntity(id: 17, name: 'Advanced Data', insideDirectionId: 11),
  const DirectionEntity(id: 18, name: 'Advanced Sheets', insideDirectionId: 11),
  const DirectionEntity(id: 19, name: 'Advanced Exams', insideDirectionId: 11),
  const DirectionEntity(id: 20, name: 'Advanced Records', insideDirectionId: 11),
  const DirectionEntity(id: 21, name: 'Advanced Other', insideDirectionId: 11),
  const DirectionEntity(id: 22, name: 'Advanced Lectures', insideDirectionId: 17),
  const DirectionEntity(id: 23, name: 'Advanced Sections', insideDirectionId: 17),
  const DirectionEntity(id: 24, name: 'أخلاقيات بيانات', insideDirectionId: 14),
  const DirectionEntity(id: 25, name: 'أخلاقيات امتحانات', insideDirectionId: 14),
  const DirectionEntity(id: 26, name: 'أخلاقيات اخرى', insideDirectionId: 14),
  const DirectionEntity(id: 27, name: 'AI Data', insideDirectionId: 12),
  const DirectionEntity(id: 28, name: 'AI sheets', insideDirectionId: 12),
  const DirectionEntity(id: 29, name: 'AI Exams', insideDirectionId: 12),
  const DirectionEntity(id: 30, name: 'أخلاقيات ميدتيرم', insideDirectionId: 25),
  const DirectionEntity(id: 31, name: 'Ai sheets lec', insideDirectionId: 28),
];
