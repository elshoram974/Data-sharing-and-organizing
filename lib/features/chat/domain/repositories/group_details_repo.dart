import 'package:data_sharing_organizing/core/status/status.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../data/models/group_details_members/group_members_model.dart';
import '../../data/models/search_member_model/searched_user_model.dart';
import '../entities/edit_group_params.dart';
import '../entities/group_permissions_params.dart';

abstract class GroupDetailsRepositories {
  const GroupDetailsRepositories();
  Stream<Status<List<GroupMember>>> getMembers({
    required int groupId,
    required int userId,
  });

  Future<Status<List<SearchedUserModel>>> searchMembers(String query);

  Future<List<GroupMember>> updateMembersLocal(
    List<GroupMember> members,
    GroupHomeEntity group,
  );

  Future<Status<void>> addMember(
    SearchedUserModel member,
    GroupHomeEntity group,
  );

  Future<Status<void>> removeMember(GroupMember member, GroupHomeEntity group);

  Future<Status<void>> changeAdmin(
    bool makeAdmin,
    GroupMember member,
    GroupHomeEntity group,
  );

  Future<Status<void>> changeInteraction(
    bool canInteract,
    int memberId,
    GroupHomeEntity group,
  );

  Future<Status<void>> changePermissions(GroupPermissionsParams params);

  Future<Status<void>> editGroup(EditGroupParams params);
  Future<Status<void>> removeGroupImage({
    required int adminId,
    required int groupId,
  });
}
