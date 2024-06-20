import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';
import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';

class NewGroupRemoteParams extends Equatable {
  final AuthUserEntity user;
  final String groupName;
  final MyFileData? image;
  final GroupAccessType accessType;
  final GroupDiscussionType discussionType;
  final List<int> usersToAdd;

  const NewGroupRemoteParams({
    required this.user,
    required this.groupName,
    required this.image,
    required this.accessType,
    required this.discussionType,
    required this.usersToAdd,
  });
  @override
  List<Object?> get props => [
        user,
        groupName,
        accessType,
        discussionType,
        usersToAdd,
      ];
}
