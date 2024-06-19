import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:data_sharing_organizing/features/chat/data/models/search_member_model/searched_member_model.dart';

import '../../domain/repositories/group_details_repo.dart';
import '../datasources/local_data_sources/group_details_local_data_sources.dart';
import '../datasources/remote_data_sources/group_details_remote_data_sources.dart';
import '../models/group_details_members/group_members_model.dart';

class GroupDetailsRepositoriesImp extends GroupDetailsRepositories {
  const GroupDetailsRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final GroupDetailsLocalDataSource localDataSource;
  final GroupDetailsRemoteDataSource remoteDataSource;

  @override
  Stream<Status<List<GroupMember>>> getMembers({
    required int groupId,
    required int userId,
  }) async* {
    yield Success(
      localDataSource.getGroupMembers(groupId: groupId, userId: userId),
    );

    yield* Stream.fromFuture(
      executeAndHandleErrors<List<GroupMember>>(
        () async {
          final List<GroupMember> members =
              await remoteDataSource.getGroupMembers(groupId);
          return await localDataSource.saveGroupMembers(
            groupId: groupId,
            userId: userId,
            members: members,
          );
        },
      ),
    );
  }

  @override
  Future<Status<List<SearchedMemberModel>>> searchMembers(String query) {
    return executeAndHandleErrors<List<SearchedMemberModel>>(
      () => remoteDataSource.searchMembers(query),
    );
  }
}
