import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/group_home_entity.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();
  Future<List<GroupHomeEntity>> getGroups(AuthUserEntity user, int page);
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final APIServices service;

  HomeRemoteDataSourceImp(this.service);

  @override
  Future<List<GroupHomeEntity>> getGroups(AuthUserEntity user, int page) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.getGroups,
      {'userId': user.id, 'pageNumber': page, 'groupsPerPage': 10},
    );
    print(response);
    return [];
  }
}
