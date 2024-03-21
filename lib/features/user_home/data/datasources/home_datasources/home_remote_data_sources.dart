import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/group_home_entity.dart';
import '../../models/home_data/home_data.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
  Future<HomeData> getGroups(
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
  Future<HomeData> getGroups(
    AuthUserEntity user,
    int page,
    int pageSize,
  ) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.userHome,
      {
        'user_id': '${user.id}',
        'user_password': user.password,
        'pageNumber': '$page',
        'groupsPerPage': '$pageSize',
      },
    );
    return HomeData.fromMap(response);
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
    Map<String, dynamic> response = await service.post(
      AppLinks.removeGroups,
      {'userId': '${user.id}', 'removedGroupsIds': json.encode(groupsIds)},
    );
    print(response);
    // return response['status'] == 'success';
    // it always returns true if the operation is done successfully
    return true;
  }
}
