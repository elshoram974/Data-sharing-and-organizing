import 'package:data_sharing_organizing/core/status/status.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../entities/new_group_remote_param.dart';

abstract class NewGroupRepositories {
  const NewGroupRepositories();

  Future<Status<List<GroupHomeEntity>>> createNewGroup(
    NewGroupRemoteParams params,
  );
}
