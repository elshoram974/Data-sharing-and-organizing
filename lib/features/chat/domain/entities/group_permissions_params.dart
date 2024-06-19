import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:equatable/equatable.dart';

class GroupPermissionsParams extends Equatable {
  final int adminId;
  final int groupId;
  final GroupDiscussionType? discussionType;
  final GroupAccessType? accessType;

  const GroupPermissionsParams({
    required this.adminId,
    required this.groupId,
    required this.discussionType,
    required this.accessType,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [adminId, groupId, discussionType, accessType];
}
