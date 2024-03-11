import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';

import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:data_sharing_organizing/features/user_home/domain/entities/group_home_entity.dart';

import '../../domain/repositories/home_repositories.dart';
import '../datasources/home_datasources/home_local_data_sources.dart';
import '../datasources/home_datasources/home_remote_data_sources.dart';

class HomeRepositoriesImp extends HomeRepositories {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final int groupsPerPage = 10;

  @override
  Future<Status<List<GroupHomeEntity>>> getGroups(
    ({int page, AuthUserEntity user, bool getMyGroups}) param,
  ) {
    final List<GroupHomeEntity> groups = [];

    return executeAndHandleErrors<List<GroupHomeEntity>>(
      () async {
        groups.clear();
        groups.addAll(await remoteDataSource.getGroups(param.user, param.page, param.getMyGroups? 1000 : groupsPerPage));
        await localDataSource.saveGroups(groups);
        return !param.getMyGroups? groups: groups.where((group) => group.ownerId == param.user.id).toList();
      },
      () async {
        groups.clear();
        groups.addAll(localDataSource.getSavedGroupsPerPage(param.page, param.getMyGroups? 1000 : groupsPerPage));
        return !param.getMyGroups? groups: groups.where((group) => group.ownerId == param.user.id).toList();
      },
    );
  }

  @override
  Future<Status<bool>> exitFromSomeGroups(
    ({List<GroupHomeEntity> removedGroups, AuthUserEntity user}) param,
  ) {
    return executeAndHandleErrors<bool>(
      () async {
        final bool isExit = await remoteDataSource.exitFromSomeGroups(
            param.user, param.removedGroups);
        if (isExit) await localDataSource.removeSomeGroups(param.removedGroups);
        return isExit;
      },
    );
  }

  @override
  Future<Status<Iterable<int>>> markAsUnRead(List<GroupHomeEntity> groups) {
    return executeAndHandleErrors<Iterable<int>>(()=> localDataSource.markAsUnRead(groups));
  }
}
