import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../entities/activity_entity.dart';
import '../entities/data_in_directory.dart';
import '../entities/directory_entity.dart';
import '../entities/member_entity.dart';

abstract class BOTRepositories {
  const BOTRepositories();
  List<types.Message> loadBotMessages(int groupId);
  Future<void> saveBotMessages(GroupHomeEntity group, List<types.Message> messages);
  Stream<Status<DataInDirectory>> getDirActInside({int? dirId, required int groupId});

  Future<Status<void>> approveActivity(MemberEntity currentMember, ActivityEntity activity, bool makeApproved);
  Future<Status<void>> deleteActivity(MemberEntity currentMember, ActivityEntity activity);
  Future<Status<void>> blockUserWithActivity(ActivityEntity activity);

  Future<Status<void>> approveDirectory(MemberEntity currentMember, DirectoryEntity dir, bool makeApproved);
  Future<Status<void>> deleteDirectory(MemberEntity currentMember, DirectoryEntity dir);
  Future<Status<void>> blockUserWithDir(DirectoryEntity dir);

  Future<Status<List<ActivityEntity>>> askAI(ActivityEntity activity);
}
