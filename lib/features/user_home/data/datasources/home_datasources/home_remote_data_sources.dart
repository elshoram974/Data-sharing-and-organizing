import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/group_home_entity.dart';
import '../../models/home_data/home_data.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
  Future<HomeData> getGroups(AuthUserEntity user);
  Future<bool> exitFromSomeGroups(
    AuthUserEntity user,
    List<GroupHomeEntity> removedGroups,
  );

  Future<bool> editNotification(GroupHomeEntity group);
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final APIServices service;

  const HomeRemoteDataSourceImp(this.service);

  @override
  Future<HomeData> getGroups(AuthUserEntity user) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.userHome,
      {
        'user_id': '${user.id}',
        'user_password': user.password,
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
    await service.post(
      AppLinks.removeGroups,
      {'user_id': '${user.id}', 'group_id': json.encode(groupsIds)},
    );
    return true;
  }

  @override
  Future<bool> editNotification(GroupHomeEntity group) async {
    await service.post(
      'AppLinks.editNotification',
      {
        'member_id': '${group.memberEntity.user.id}',
        'group_id': '${group.id}',
        'notify': group.memberEntity.notification.inString,
      },
    );
    return true;
  }
}
