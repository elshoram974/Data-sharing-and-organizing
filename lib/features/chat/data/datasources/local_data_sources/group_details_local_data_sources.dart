import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/group_details_members/group_details_members.dart';
import '../../models/group_details_members/group_members_model.dart';

abstract class GroupDetailsLocalDataSource {
  const GroupDetailsLocalDataSource();

  List<GroupMember> getGroupMembers({
    required int groupId,
    required int userId,
  });

  Future<List<GroupMember>> saveGroupMembers({
    required int groupId,
    required int userId,
    required List<GroupMember> members,
  });
}

class GroupDetailsLocalDataSourceImp extends GroupDetailsLocalDataSource {
  GroupDetailsLocalDataSourceImp();

  late final Box<GroupDetailsMembers> membersBox =
      Hive.box<GroupDetailsMembers>(AppStrings.groupsMembers);

  @override
  List<GroupMember> getGroupMembers({
    required int groupId,
    required int userId,
  }) {
    final List<GroupMember>? list = membersBox.get(groupId)?.members;
    if (list == null || list.isEmpty) return [];

    final int i = list.indexWhere((e) => e.memberId == userId);
    final GroupMember thisUser = list.removeAt(i).copyWith(
          firstName: 'You',
          lastName: '',
        );

    List<GroupMember> admins = list.where((e) => e.isAdmin).toList();
    admins.sort(_groupMemberComparator);
    list.removeWhere((e) => e.isAdmin);

    list.sort(_groupMemberComparator);

    list.insertAll(0, admins);
    list.insert(0, thisUser);

    return list;
  }

  @override
  Future<List<GroupMember>> saveGroupMembers({
    required int groupId,
    required int userId,
    required List<GroupMember> members,
  }) async {
    await membersBox.put(
      groupId,
      GroupDetailsMembers(status: 'Success', members: members),
    );

    return getGroupMembers(groupId: groupId, userId: userId);
  }
}

int _groupMemberComparator(GroupMember a, GroupMember b) {
  String sortedNameA = a.firstName + a.lastName;
  String sortedNameB = b.firstName + b.lastName;

  return sortedNameA.compareTo(sortedNameB);
}
