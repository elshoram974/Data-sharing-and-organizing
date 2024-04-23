import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/activity_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/directory_entity.dart';
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

  Future<bool> blockUserWithActivity({required ActivityEntity activity});

  Future<bool> approveDirectory({
    required DirectoryEntity directory,
    required MemberEntity currentMember,
    required bool makeApproved,
  });
  Future<bool> deleteDirectory({
    required DirectoryEntity directory,
    required MemberEntity currentMember,
  });
  Future<bool> blockUserWithDir({required DirectoryEntity directory});

  Future<List<ActivityEntity>> askAI({required ActivityEntity activity});
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

  @override
  Future<bool> blockUserWithActivity({required ActivityEntity activity}) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.blockUserWithActivity,
      {
        'activity_id': '${activity.id}',
        'group_id': '${activity.groupId}',
        'user_id_blocked': '${activity.createdBy.user.id}',
      },
    );
    // TODO: implement blockUserWithActivity and Link don't forget
    throw UnimplementedError(response.toString());
  }

  @override
  Future<bool> approveDirectory({
    required DirectoryEntity directory,
    required MemberEntity currentMember,
    required bool makeApproved,
  }) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.approveDirectory,
      {
        'directory_id': '${directory.id}',
        'group_id': '${directory.groupId}',
        'user_id': '${currentMember.user.id}',
        'makeApproved': makeApproved ? '1' : '0',
      },
    );
    // TODO: write code of getting directories here and Link don't forget
    throw UnimplementedError(response.toString());
  }

  @override
  Future<bool> deleteDirectory({
    required DirectoryEntity directory,
    required MemberEntity currentMember,
  }) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.deleteDirectory,
      {
        'directory_id': '${directory.id}',
        'group_id': '${directory.groupId}',
        'user_id': '${currentMember.user.id}',
      },
    );
    // TODO: write code of getting directories here and Link don't forget
    throw UnimplementedError(response.toString());
  }

  @override
  Future<bool> blockUserWithDir({required DirectoryEntity directory}) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.blockUserWithDir,
      {
        'directory_id': '${directory.id}',
        'group_id': '${directory.groupId}',
        'user_id_blocked': '${directory.createdBy.user.id}',
      },
    );
    // TODO: implement blockUserWithActivity and Link don't forget
    throw UnimplementedError(response.toString());
  }

  @override
  Future<List<ActivityEntity>> askAI({required ActivityEntity activity}) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.askAI,
      {'message': activity.content},
    );
    // TODO: implement blockUserWithActivity and Link don't forget
    throw UnimplementedError(response.toString());
  }
}
