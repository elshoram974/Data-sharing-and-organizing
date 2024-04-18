import 'package:equatable/equatable.dart';

import 'activity_entity.dart';
import 'directory_entity.dart';

class DataInDirectory extends Equatable {
  final List<DirectoryEntity> directories;
  final List<ActivityEntity> activities;

  const DataInDirectory({required this.directories, required this.activities});

  @override
  List<Object?> get props => [activities, directories];
}
