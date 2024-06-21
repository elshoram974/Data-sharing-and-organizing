import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../domain/entities/edit_group_params.dart';
import '../../../domain/entities/group_permissions_params.dart';
import '../../models/group_details_members/group_details_members.dart';
import '../../models/group_details_members/group_members_model.dart';
import '../../models/search_member_model/search_user.dart';
import '../../models/search_member_model/searched_user_model.dart';

abstract class GroupDetailsRemoteDataSource {
  const GroupDetailsRemoteDataSource();

  Future<List<GroupMember>> getGroupMembers(int groupId);

  Future<List<SearchedUserModel>> searchMembers(
    String query,
    int page,
    int limit,
  );

  Future<void> addMembers(
    List<SearchedUserModel> newMembers,
    GroupHomeEntity group,
  );

  Future<void> removeMember(GroupMember member, GroupHomeEntity group);

  Future<void> changeAdmin(
    bool makeAdmin,
    GroupMember member,
    GroupHomeEntity group,
  );

  Future<void> changeInteraction(
    bool canInteract,
    int memberId,
    GroupHomeEntity group,
  );

  Future<void> changePermissions(GroupPermissionsParams params);

  Future<String?> editGroup(EditGroupParams params);
  Future<void> removeGroupImage({required int adminId, required int groupId});
}

class GroupDetailsRemoteDataSourceImp extends GroupDetailsRemoteDataSource {
  final APIServices service;

  const GroupDetailsRemoteDataSourceImp(this.service);

  @override
  Future<List<GroupMember>> getGroupMembers(int groupId) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.groupMembers,
      {'group_id': '$groupId'},
    );
    return GroupDetailsMembers.fromMap(response).members;
  }

  @override
  Future<List<SearchedUserModel>> searchMembers(
    String query,
    int page,
    int limit,
  ) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.searchUsers,
      {'quere': query, 'page': '$page', 'limit': '$limit'},
    );
    return SearchUser.fromMap(response).searchedUsers;
  }

  @override
  Future<void> addMembers(
    List<SearchedUserModel> newMembers,
    GroupHomeEntity group,
  ) async {
    List<int> usersId = [];
    for (SearchedUserModel e in newMembers) {
      usersId.add(e.userId);
    }
    await service.post(
      AppLinks.addMember,
      {
        'user_id': '${group.memberEntity.user.id}',
        'group_id': '${group.groupId}',
        'list_users_id': jsonEncode(usersId),
      },
    );
  }

  @override
  Future<void> removeMember(
    GroupMember member,
    GroupHomeEntity group,
  ) async {
    await service.post(
      AppLinks.removeMember,
      {
        'user_id': '${group.memberEntity.user.id}',
        'group_id': '${group.groupId}',
        'member_id': '${member.memberId}',
      },
    );
  }

  @override
  Future<void> changeAdmin(
    bool makeAdmin,
    GroupMember member,
    GroupHomeEntity group,
  ) async {
    await service.post(
      AppLinks.changeAdmin,
      {
        'user_id': '${group.memberEntity.user.id}',
        'group_id': '${group.groupId}',
        'member_id': '${member.memberId}',
        'is_admin': makeAdmin.toString(),
      },
    );
  }

  @override
  Future<void> changeInteraction(
    bool canInteract,
    int memberId,
    GroupHomeEntity group,
  ) async {
    await service.post(
      AppLinks.blockUserDirectly,
      {
        'user_id': '$memberId',
        'admin_id': '${group.memberEntity.user.id}',
        'group_id': '${group.groupId}',
        'can_interaction': canInteract ? '1' : "'0'",
      },
    );
  }

  @override
  Future<void> changePermissions(GroupPermissionsParams params) async {
    final Map<String, String> body = {
      'user_id': '${params.adminId}',
      'group_id': '${params.groupId}',
    };
    if (params.discussionType != null) {
      body['discussion_type'] = params.discussionType!.inString;
    } else if (params.accessType != null) {
      body['access_type'] = params.accessType!.inString;
    } else {
      throw "Can't make discussion_type and access_type null";
    }
    await service.post(AppLinks.editGroupPermissions, body);
  }

  @override
  Future<String?> editGroup(EditGroupParams params) async {
    String? imageLink;
    final Map<String, String> body = {
      'user_id': '${params.adminId}',
      'group_id': '${params.groupId}',
    };
    if (params.groupName != null) {
      body['name'] = params.groupName!;
      await service.post(AppLinks.editGroupData, body);
    } else if (params.groupImage != null) {
      final res = await service.uploadFile(
        link: AppLinks.editGroupData,
        fieldName: 'image',
        fileToUpload: params.groupImage!,
        body: body,
      );
      imageLink = res['group']['group_image'] as String?;
    } else {
      throw "Can't make groupName and groupImage null";
    }
    return imageLink;
  }

  @override
  Future<void> removeGroupImage({
    required int adminId,
    required int groupId,
  }) async {
    await service.post(
      AppLinks.removeGroupImage,
      {
        'user_id': '$adminId',
        'group_id': '$groupId',
      },
    );
  }
}
