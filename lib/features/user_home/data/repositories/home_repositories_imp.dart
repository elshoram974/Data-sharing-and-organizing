import 'package:data_sharing_organizing/core/status/errors/failure.dart';
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
  Future<Status<List<GroupHomeEntity>>> getGroups(({int page, AuthUserEntity user}) param) async {
    final Status<List<GroupHomeEntity>> res = await executeAndHandleErrors<List<GroupHomeEntity>>(
      () => remoteDataSource.getGroups(param.user, param.page, groupsPerPage),
    );

    if (res is Failure<List<GroupHomeEntity>>) {
      final List<GroupHomeEntity> groups = localDataSource.getSavedGroupsPerPage(param.page, groupsPerPage);
      return res.copyWith(data: groups);
    }
    return res;
  }

  @override
  Future<Status<bool>> exitFromSomeGroups(({List<GroupHomeEntity> removedGroups, AuthUserEntity user}) param) {
    return executeAndHandleErrors<bool>(
      ()async{
        final bool isExit = await remoteDataSource.exitFromSomeGroups(param.user, param.removedGroups);
        if(isExit) await localDataSource.removeSomeGroups(param.removedGroups);
        return isExit;
      },
    );
  }
}
