import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/activity_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/member_entity.dart';

import '../../../domain/entities/data_in_directory.dart';

abstract class DirectoriesRemoteDataSource {
  const DirectoriesRemoteDataSource();
  Future<DataInDirectory> getDirActInside({
    int? dirId,
    required int groupId,
  });

  Future<bool> approveActivity({
    required ActivityEntity activity,
    required MemberEntity currentMember,
    required bool makeApproved,
  });

  Future<bool> deleteActivity({
    required ActivityEntity activity,
    required MemberEntity currentMember,
  });
}

class DirectoriesRemoteDataSourceImp extends DirectoriesRemoteDataSource {
  final APIServices service;

  const DirectoriesRemoteDataSourceImp(this.service);

  @override
  Future<DataInDirectory> getDirActInside({
    int? dirId,
    required int groupId,
  }) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.getDirectoriesInside,
      {'direction_id': '$dirId', 'group_id': '$groupId'},
    );
    // TODO: write code of getting directories here and Link don't forget
    throw UnimplementedError(response.toString());
  }

  @override
  Future<bool> approveActivity({
    required ActivityEntity activity,
    required MemberEntity currentMember,
    required bool makeApproved,
  }) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.approveActivity,
      {
        'activity_id': '${activity.id}',
        'group_id': '${activity.groupId}',
        'user_id': '${currentMember.user.id}',
        'makeApproved': makeApproved ? '1' : '0',
      },
    );
    // TODO: write code of getting directories here and Link don't forget
    throw UnimplementedError(response.toString());
  }

  @override
  Future<bool> deleteActivity({
    required ActivityEntity activity,
    required MemberEntity currentMember,
  }) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.deleteActivity,
      {
        'activity_id': '${activity.id}',
        'group_id': '${activity.groupId}',
        'user_id': '${currentMember.user.id}',
      },
    );
    // TODO: write code of getting directories here and Link don't forget
    throw UnimplementedError(response.toString());
  }
}
