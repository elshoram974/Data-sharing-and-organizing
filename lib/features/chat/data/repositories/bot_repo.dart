import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';
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
  Future<void> saveBottomHeight(double height, int groupId) =>
      localDataSource.saveBottomHeight(height, groupId);

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
}
