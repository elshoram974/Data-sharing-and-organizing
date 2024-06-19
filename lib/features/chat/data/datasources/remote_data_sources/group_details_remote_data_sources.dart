import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../models/group_details_members/group_details_members.dart';
import '../../models/group_details_members/group_members_model.dart';
import '../../models/search_member_model/search_user.dart';
import '../../models/search_member_model/searched_user_model.dart';

abstract class GroupDetailsRemoteDataSource {
  const GroupDetailsRemoteDataSource();

  Future<List<GroupMember>> getGroupMembers(int groupId);

  Future<List<SearchedUserModel>> searchMembers(String query);

  Future<void> addMembers(
    List<SearchedUserModel> newMembers,
    GroupHomeEntity group,
  );
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
  Future<List<SearchedUserModel>> searchMembers(String query) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.searchUsers,
      {'quere': query},
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
}
