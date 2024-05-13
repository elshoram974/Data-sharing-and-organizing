import 'dart:typed_data';

import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';
import 'package:data_sharing_organizing/features/chat/data/models/attachment_model.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/activity_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/directory_entity.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/member_entity.dart';

import '../../../domain/entities/data_in_directory.dart';
import '../../models/dir_activities_bot.dart';

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

  Future<DirectoryEntity> addNewDir({required DirectoryEntity dir});

  Future<ActivityEntity> addNewActivity({
    required ActivityEntity activity,
    required Uint8List? file,
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
    final DirActivitiesBot temp = DirActivitiesBot.fromMap(response);
    return DataInDirectory(
      directories: temp.directories,
      activities: temp.activities,
      groupId: groupId,
      insideDirectoryId: dirId,
    );
  }

  @override
  Future<bool> approveActivity({
    required ActivityEntity activity,
    required MemberEntity currentMember,
    required bool makeApproved,
  }) async {
    await service.post(
      AppLinks.approveActivity,
      {
        'activity_id': '${activity.id}',
        'group_id': '${activity.groupId}',
        'user_id': '${currentMember.user.id}',
        'approved': makeApproved ? '1' : '0',
      },
    );
    return true;
  }

  @override
  Future<bool> deleteActivity({
    required ActivityEntity activity,
    required MemberEntity currentMember,
  }) async {
    await service.post(
      AppLinks.deleteActivity,
      {
        'activity_id': '${activity.id}',
        'group_id': '${activity.groupId}',
        'user_id': '${currentMember.user.id}',
      },
    );
    return true;
  }

  @override
  Future<bool> blockUserWithActivity({required ActivityEntity activity}) async {
    await service.post(
      AppLinks.blockUserGroup,
      {
        'activity_id': '${activity.id}',
        'group_id': '${activity.groupId}',
        'user_id': '${activity.createdBy.user.id}',
      },
    );
    return true;
  }

  @override
  Future<bool> approveDirectory({
    required DirectoryEntity directory,
    required MemberEntity currentMember,
    required bool makeApproved,
  }) async {
    await service.post(
      AppLinks.approveDirectory,
      {
        'direction_id': '${directory.id}',
        'group_id': '${directory.groupId}',
        'user_id': '${currentMember.user.id}',
        'approved': makeApproved ? '1' : '0',
      },
    );
    return true;
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
     await service.post(
      AppLinks.blockUserGroup,
      {
        'direction_id': '${directory.id}',
        'group_id': '${directory.groupId}',
        'user_id': '${directory.createdBy.user.id}',
      },
    );
    return true;
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

  @override
  Future<ActivityEntity> addNewActivity({
    required ActivityEntity activity,
    required Uint8List? file,
  }) async {
    Map<String, dynamic> response;
    final Map<String, String> body = {
      'activity_group_id': '${activity.groupId}',
      'activity_type': activity.type.inString,
      // 'activity_reply_on': 'null',
      'activity_content': activity.content,
      'activity_date': activity.createdAt.toIso8601String(),
      'activity_notify_others': activity.notifyOthers.inString,
      'activity_owner_id': '${activity.createdBy.user.id}',
    };
    if (activity.insideDirectoryId != null) body['activity_direction_id'] = '${activity.insideDirectoryId}';
    final AttachmentModel? attachment = activity.attachment;
    if (attachment != null) {
      body['activity_attachments_size'] = '${attachment.size}';
      body['activity_attachments_url'] = attachment.uri;
      body['activity_attachments_mimetype'] = attachment.mimeType!;
      switch (activity.type) {
        case MessageType.photo:
          body['activity_attachments_height'] = '${attachment.height}';
          body['activity_attachments_width'] = '${attachment.width}';

        default:
      }
      response = await service.uploadFile(
        link: AppLinks.addNewActivity,
        fieldName: 'file', // TODO: u may have to change this
        fileToUpload: MyFileData(
          path: attachment.uri,
          type: attachment.mimeType!.split('/').last,
          ext: attachment.mimeType!.split('/').last,
          file: file!,
        ),
        body: body,
      );
    } else {
      response = await service.post(AppLinks.addNewActivity, body);
    }
    // TODO: implement addNewActivity
    throw UnimplementedError("$response");
  }

  @override
  Future<DirectoryEntity> addNewDir({required DirectoryEntity dir}) async {
    final Map<String, String> body = {
      'user_id': '${dir.createdBy.user.id}',
      'address': dir.name,
      'max_activity': '1000',
      'group_id': '${dir.groupId}',
    };
    if (dir.insideDirectoryId != null) body['inside_dir_id'] = '${dir.insideDirectoryId}';
    Map<String, dynamic> response = await service.post(
      AppLinks.addNewDir,
      body,
    );
    return dir.copyWith(
      id: response['response']['direction_id'] as int,
      isApproved: response['response']['direction_is_approved'] as int == 1,
    );
  }
}
