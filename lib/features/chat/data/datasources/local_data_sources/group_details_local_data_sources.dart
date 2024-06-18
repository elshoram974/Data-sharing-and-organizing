import '../../models/group_details_members/group_members_model.dart';

abstract class GroupDetailsLocalDataSource {
  const GroupDetailsLocalDataSource();

  List<GroupMember> getGroupMembers({
    required int groupId,
    required int userId,
  });

  Future<List<GroupMember>> saveGroupMembers({
    required int groupId,
    required List<GroupMember> members,
  });
}

class GroupDetailsLocalDataSourceImp extends GroupDetailsLocalDataSource {
  const GroupDetailsLocalDataSourceImp();

  @override
  List<GroupMember> getGroupMembers({
    required int groupId,
    required int userId,
  }) {
    // TODO: implement getGroupMembers
    throw UnimplementedError();
  }

  @override
  Future<List<GroupMember>> saveGroupMembers({
    required int groupId,
    required List<GroupMember> members,
  }) {
    // TODO: implement saveGroupMembers
    throw UnimplementedError();
  }
}
