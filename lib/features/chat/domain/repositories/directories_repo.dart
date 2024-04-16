import 'package:data_sharing_organizing/core/status/status.dart';

import '../entities/directory_entity.dart';

abstract class DirectoriesRepositories {
  const DirectoriesRepositories();
  Future<void> saveBottomHeight(double height, int groupId);
  Stream<Status<List<DirectoryEntity>>> getDirectoriesInside([int? dirId]);
}
