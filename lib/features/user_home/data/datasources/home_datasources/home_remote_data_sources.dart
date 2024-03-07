import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/group_home_entity.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
  Future<List<GroupHomeEntity>> getGroups(
    AuthUserEntity user,
    int page,
    int pageSize,
  );
  Future<bool> exitFromSomeGroups(
    AuthUserEntity user,
    List<GroupHomeEntity> removedGroups,
  );
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final APIServices service;

  const HomeRemoteDataSourceImp(this.service);

  @override
  Future<List<GroupHomeEntity>> getGroups(
    AuthUserEntity user,
    int page,
    int pageSize,
  ) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.getGroups,
      {'userId': user.id, 'pageNumber': page, 'groupsPerPage': 10},
    );
    print(response);
    return [];
  }

  @override
  Future<bool> exitFromSomeGroups(
    AuthUserEntity user,
    List<GroupHomeEntity> removedGroups,
  ) async {
    final List<int> groupsIds = [];
    for (final e in removedGroups) {
      groupsIds.add(e.id);
    }
    // TODO: implement removeSomeGroups
    Map<String, dynamic> response = await service.post(
      'AppLinks.getGroups',
      {'userId': user.id, 'removedGroupsIds': json.encode(groupsIds)},
    );
    print(response);
    // return response['status'] == 'success';
    // it always returns true if the operation is done successfully
    return true;
  }
}
