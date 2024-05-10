import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';

import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:data_sharing_organizing/features/user_home/domain/entities/group_home_entity.dart';

import '../../domain/repositories/home_repositories.dart';
import '../datasources/home_datasources/home_local_data_sources.dart';
import '../datasources/home_datasources/home_remote_data_sources.dart';
import '../models/home_data/home_data.dart';

class HomeRepositoriesImp extends HomeRepositories {
  final HomeLocalDataSource localDataSource;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Stream<Status<List<GroupHomeEntity>>> getGroups(AuthUserEntity user) async* {
    yield Success(localDataSource.getAllGroups());

    yield* Stream.fromFuture(
      executeAndHandleErrors<List<GroupHomeEntity>>(
        () async {
          final List<GroupHomeEntity> groups = [];
          final HomeData results = await remoteDataSource.getGroups(user);
          groups.addAll(results.groups);
          return await localDataSource.saveGroups(groups, results.user);
        },
      ),
    );
  }

  @override
  Stream<Status<List<GroupHomeEntity>>> getMyGroups(
      AuthUserEntity user) async* {
    yield Success(
      localDataSource
          .getAllGroups()
          .where((group) => group.ownerId == user.id)
          .toList(),
    );

    yield* Stream.fromFuture(
      executeAndHandleErrors<List<GroupHomeEntity>>(
        () async {
          final List<GroupHomeEntity> groups = [];
          final HomeData results = await remoteDataSource.getGroups(user);
          groups.addAll(results.groups);
          return (await localDataSource.saveGroups(groups, results.user))
              .where((group) => group.ownerId == user.id)
              .toList();
        },
      ),
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
    return executeAndHandleErrors<Iterable<int>>(
        () => localDataSource.markAsUnRead(groups));
  }

  @override
  Future<void> updateGroupLocally(GroupHomeEntity groupUpdated) {
    return localDataSource.updateThisGroup(groupUpdated);
  }
}
