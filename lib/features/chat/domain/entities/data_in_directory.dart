import 'package:equatable/equatable.dart';

import 'activity_entity.dart';
import 'directory_entity.dart';

class DataInDirectory extends Equatable {
  final List<DirectoryEntity> directories;
  final List<ActivityEntity> activities;
  final int groupId;
  final int? insideDirectoryId;

  const DataInDirectory({
    required this.directories,
    required this.activities,
    required this.groupId,
    required this.insideDirectoryId,
  });

  @override
  List<Object?> get props => [
        activities,
        directories,
        groupId,
        insideDirectoryId,
      ];
}
