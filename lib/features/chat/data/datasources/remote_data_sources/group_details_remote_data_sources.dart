import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../models/group_details_members/group_details_members.dart';
import '../../models/group_details_members/group_members_model.dart';

abstract class GroupDetailsRemoteDataSource {
  const GroupDetailsRemoteDataSource();

  Future<List<GroupMember>> getGroupMembers(int groupId);
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
}
