import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../user_home/data/models/home_data/group.dart';
import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/entities/new_group_remote_param.dart';

abstract class NewGroupRemoteDataSource {
  const NewGroupRemoteDataSource();

  Future<GroupHomeEntity> createNewGroup(NewGroupRemoteParams params);
}

class NewGroupRemoteDataSourceImp extends NewGroupRemoteDataSource {
  final APIServices service;

  const NewGroupRemoteDataSourceImp(this.service);
  @override
  Future<GroupHomeEntity> createNewGroup(NewGroupRemoteParams params) async {
    final Map<String, String> body = {
      'user_id': '${params.user.id}',
      'name': params.groupName,
      'access_type': params.accessType.inString,
      'category': 'personal',
      'discussion_type': params.discussionType.inString,
      'list_users_id': jsonEncode(params.usersToAdd),
    };
    late final Map<String, dynamic> response;
    if (params.image != null) {
      response = await service.uploadFile(
        link: AppLinks.makeNewGroup,
        fieldName: 'image',
        fileToUpload: params.image!,
        body: body,
      );
    } else {
      response = await service.post(AppLinks.makeNewGroup, body);
    }
    return GroupDetails.fromMapNewGroup(response, params.user);
  }
}
