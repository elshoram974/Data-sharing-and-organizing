import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/activity_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/directory_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/member_entity.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/entities/data_in_directory.dart';
import '../../domain/repositories/bot_repo.dart';
import '../datasources/local_data_sources/bot_local_data_sources.dart';
import '../datasources/remote_data_sources/bot_remote_data_sources.dart';

class BOTRepositoriesImp extends BOTRepositories {
  const BOTRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  final BOTLocalDataSource localDataSource;
  final DirectoriesRemoteDataSource remoteDataSource;

  @override
  Stream<Status<DataInDirectory>> getDirActInside({
    int? dirId,
    required int groupId,
  }) async* {
    yield Success(localDataSource.getDirActInside(dirId, groupId));

    yield* Stream.fromFuture(
      executeAndHandleErrors<DataInDirectory>(
        () async {
          final DataInDirectory data = await remoteDataSource.getDirActInside(
            dirId: dirId,
            groupId: groupId,
          );
          await localDataSource.saveDirActInside(data);
          return data;
        },
      ),
    );
  }

  @override
  Future<void> saveBotMessages(GroupHomeEntity group, List<types.Message> messages) {
    return localDataSource.saveBotMessages(group, messages);
  }

  @override
  List<types.Message> loadBotMessages(int groupId) {
    return localDataSource.getBotMessages(groupId);
  }

  @override
  Future<Status<void>> approveActivity(MemberEntity currentMember, ActivityEntity activity, bool makeApproved) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isUploaded = await remoteDataSource.approveActivity(
          activity: activity,
          currentMember: currentMember,
          makeApproved: makeApproved,
        );
        if(isUploaded) await localDataSource.approveActivity(activity,makeApproved);
      },
    );
  }

  @override
  Future<Status<void>> deleteActivity(MemberEntity currentMember, ActivityEntity activity) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isDeleted = await remoteDataSource.deleteActivity(
          activity: activity,
          currentMember: currentMember,
        );
        if(isDeleted) await localDataSource.deleteActivity(activity);
      },
    );
  }

  @override
  Future<Status<void>> blockUserWithActivity(ActivityEntity activity) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isBlocked = await remoteDataSource.blockUserWithActivity(
          activity: activity,
        );
        if(isBlocked) await localDataSource.deleteActivity(activity);
      },
    );
  }

  @override
  Future<Status<void>> approveDirectory(MemberEntity currentMember, DirectoryEntity dir, bool makeApproved) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isUploaded = await remoteDataSource.approveDirectory(
          directory: dir,
          currentMember: currentMember,
          makeApproved: makeApproved,
        );
        if(isUploaded) await localDataSource.approveDirectory(dir,makeApproved);
      },
    );
  }

  @override
  Future<Status<void>> deleteDirectory(MemberEntity currentMember, DirectoryEntity dir) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isDeleted = await remoteDataSource.deleteDirectory(
          directory: dir,
          currentMember: currentMember,
        );
        if(isDeleted) await localDataSource.deleteDirectory(dir);
      },
    );
  }

  @override
  Future<Status<void>> blockUserWithDir(DirectoryEntity dir) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isBlocked = await remoteDataSource.blockUserWithDir(
          directory: dir,
        );
        if(isBlocked) await localDataSource.deleteDirectory(dir);
      },
    );
  }
}
