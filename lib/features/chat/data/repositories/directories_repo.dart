import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/directory_entity.dart';

import '../../domain/repositories/directories_repo.dart';
import '../datasources/local_data_sources/directories_local_data_sources.dart';
import '../datasources/remote_data_sources/directories_remote_data_sources.dart';

class DirectoriesRepositoriesImp extends DirectoriesRepositories {
  const DirectoriesRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  final DirectoriesLocalDataSource localDataSource;
  final DirectoriesRemoteDataSource remoteDataSource;

  @override
  Future<void> saveBottomHeight(double height, int groupId) =>
      localDataSource.saveBottomHeight(height, groupId);

  @override
  Stream<Status<List<DirectoryEntity>>> getDirectoriesInside({
    int? dirId,
    required int groupId,
  }) async* {

    yield Success(localDataSource.getDirectoriesInside(dirId, groupId));

    yield* Stream.fromFuture(
      executeAndHandleErrors<List<DirectoryEntity>>(
        () async {
          final List<DirectoryEntity> directories = await remoteDataSource.getDirectoriesInside(
            dirId: dirId,
            groupId: groupId,
          );
          await localDataSource.saveDirectories(directories);
          return directories;
        },
      ),
    );
  }
}
