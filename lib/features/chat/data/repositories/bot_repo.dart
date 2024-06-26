import 'dart:math';
import 'dart:typed_data';

import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:data_sharing_organizing/features/chat/data/models/ai_response/ai_response.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/activity_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/directory_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/member_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/notification_data_entity.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/entities/data_in_directory.dart';
import '../../domain/repositories/bot_repo.dart';
import '../datasources/local_data_sources/bot_local_data_sources.dart';
import '../datasources/remote_data_sources/directories_remote_data_sources.dart';
import '../models/ai_response/ai_reply.dart';

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
  Future<void> saveBotMessages(
      GroupHomeEntity group, List<types.Message> messages) {
    return localDataSource.saveBotMessages(group, messages);
  }

  @override
  List<types.Message> loadBotMessages(int groupId) {
    return localDataSource.getBotMessages(groupId);
  }

  @override
  Future<Status<void>> approveActivity(
      MemberEntity currentMember, ActivityEntity activity, bool makeApproved) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isUploaded = await remoteDataSource.approveActivity(
          activity: activity,
          currentMember: currentMember,
          makeApproved: makeApproved,
        );
        if (isUploaded) {
          await localDataSource.approveActivity(activity, makeApproved);
        }
      },
    );
  }

  @override
  Future<Status<void>> deleteActivity(
      MemberEntity currentMember, ActivityEntity activity) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isDeleted = await remoteDataSource.deleteActivity(
          activity: activity,
          currentMember: currentMember,
        );
        if (isDeleted) await localDataSource.deleteActivity(activity);
      },
    );
  }

  @override
  Future<Status<void>> blockUserWithActivity(
    ActivityEntity activity,
    int adminId,
  ) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isBlocked = await remoteDataSource.blockUserWithActivity(
          activity: activity,
          adminId: adminId,
        );
        if (isBlocked) await localDataSource.deleteActivity(activity);
      },
    );
  }

  @override
  Future<Status<void>> approveDirectory(
      MemberEntity currentMember, DirectoryEntity dir, bool makeApproved) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isUploaded = await remoteDataSource.approveDirectory(
          directory: dir,
          currentMember: currentMember,
          makeApproved: makeApproved,
        );
        if (isUploaded) {
          await localDataSource.approveDirectory(dir, makeApproved);
        }
      },
    );
  }

  @override
  Future<Status<void>> deleteDirectory(
      MemberEntity currentMember, DirectoryEntity dir) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isDeleted = await remoteDataSource.deleteDirectory(
          directory: dir,
          currentMember: currentMember,
        );
        if (isDeleted) await localDataSource.deleteDirectory(dir);
      },
    );
  }

  @override
  Future<Status<void>> blockUserWithDir(DirectoryEntity dir, int adminId) {
    return executeAndHandleErrors<void>(
      () async {
        final bool isBlocked = await remoteDataSource.blockUserWithDir(
          directory: dir,
          adminId: adminId,
        );
        if (isBlocked) await localDataSource.deleteDirectory(dir);
      },
    );
  }

  @override
  Stream<Status<List<ActivityEntity>>> askAI(
    ActivityEntity activity,
    MemberEntity bot,
  ) async* {
    final AiResponse ai = await remoteDataSource.askAI(activity: activity);

    for (AiReply e in ai.aiReplies ?? []) {
      yield* Stream.fromFuture(
        executeAndHandleErrors<List<ActivityEntity>>(
          () async {
            List<ActivityEntity> activities = [];
            if (e.groupId == activity.groupId || e.groupId == null) {
              if (e.message != null) {
                activities.add(
                  ActivityEntity(
                    id: Random().nextInt(9999),
                    groupId: activity.groupId,
                    createdBy: bot,
                    content: e.message!,
                    createdAt: DateTime.now(),
                    isApproved: true,
                    type: MessageType.textMessage,
                  ),
                );
              }
              if (e.activities?.isNotEmpty == true) {
                activities.addAll(
                  await remoteDataSource.getActivities(e.activities ?? []),
                );
              }
            }
            return activities;
          },
        ),
      );
    }
  }

  @override
  Future<Status<ActivityEntity>> addNewActivity(
      ActivityEntity newActivity, Uint8List? file) {
    return executeAndHandleErrors<ActivityEntity>(
      () async {
        final ActivityEntity activity = await remoteDataSource.addNewActivity(
          activity: newActivity,
          file: file,
        );
        await localDataSource.saveDirActInside(
          DataInDirectory(
            directories: const [],
            activities: [activity],
            groupId: activity.groupId,
            insideDirectoryId: activity.insideDirectoryId,
          ),
        );
        return activity;
      },
    );
  }

  @override
  Future<Status<DirectoryEntity>> addNewDir(DirectoryEntity newDir) {
    return executeAndHandleErrors<DirectoryEntity>(
      () async {
        final DirectoryEntity dir = await remoteDataSource.addNewDir(
          dir: newDir,
        );
        await localDataSource.saveDirActInside(
          DataInDirectory(
            directories: [dir],
            activities: const [],
            groupId: dir.groupId,
            insideDirectoryId: dir.insideDirectoryId,
          ),
        );
        return dir;
      },
    );
  }

  @override
  Future<Status<bool>> sendNotification(NotificationDataEntity data) {
    return executeAndHandleErrors<bool>(
      () => remoteDataSource.sendNotification(data),
    );
  }
}
