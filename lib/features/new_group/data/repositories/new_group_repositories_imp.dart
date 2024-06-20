import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';

import '../../../user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/entities/new_group_remote_param.dart';
import '../../domain/repositories/new_group_repositories.dart';
import '../datasources/new_group_remote_data_source.dart';

class NewGroupRepositoriesImp extends NewGroupRepositories {
  final HomeLocalDataSource localDataSource;
  final NewGroupRemoteDataSource remoteDataSource;

  const NewGroupRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Status<List<GroupHomeEntity>>> createNewGroup(
    NewGroupRemoteParams params,
  ) {
    return executeAndHandleErrors<List<GroupHomeEntity>>(
      () async {
        final GroupHomeEntity g = await remoteDataSource.createNewGroup(params);
        return await localDataSource.saveNewGroup(g);
      },
    );
  }
}
