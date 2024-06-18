import 'package:data_sharing_organizing/core/status/status.dart';

import '../../data/models/group_details_members/group_members_model.dart';

abstract class GroupDetailsRepositories {
  const GroupDetailsRepositories();
  Stream<Status<List<GroupMember>>> getMembers({
    required int groupId,
    required int userId,
  });
}
