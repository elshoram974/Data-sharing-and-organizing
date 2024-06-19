import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../data/models/group_details_members/group_members_model.dart';
import '../../../domain/entities/group_permissions_params.dart';
import '../../../domain/repositories/group_details_repo.dart';

part 'group_details_state.dart';

abstract class GroupDetailsCubit extends Cubit<GroupDetailsState> {
  GroupDetailsCubit() : super(const GroupDetailsInitial());

  List<GroupMember> members = [];

  Future<void> getMembers();

  Future<void> updateMembersLocal(List<GroupMember> updated);

  Future<void> removeMember(GroupMember member);

  Future<void> changeAdmin(bool makeAdmin, GroupMember member);

  Future<void> changeInteraction(bool canInteract, int memberId);

  Future<void> changePermissions(
    GroupDiscussionType? discussionType,
    GroupAccessType? accessType,
  );
}

class GroupDetailsCubitImp extends GroupDetailsCubit {
  GroupDetailsCubitImp({
    required this.group,
    required this.repo,
  }) {
    getMembers();
  }
  GroupHomeEntity group;
  final GroupDetailsRepositories repo;

  @override
  Future<void> getMembers() async {
    emit(const MembersLoadingState());
    Status<List<GroupMember>>? status;
    repo
        .getMembers(
      groupId: group.groupId,
      userId: group.memberEntity.user.id,
    )
        .listen((tempStatus) {
      status = tempStatus;
      if (tempStatus is Success<List<GroupMember>>) {
        members.clear();
        members.addAll(tempStatus.data);

        emit(GetMembersSuccessState(tempStatus.data));
        emit(const MembersLoadingState());
      }
    }).onDone(() {
      if (status is Failure<List<GroupMember>>) {
        final FailureBody failure =
            (status as Failure<List<GroupMember>>).failure;
        failureStatus(
          failure.message,
          () => emit(GetMembersFailureState(failure)),
        );
      } else {
        emit(GetMembersSuccessState(members));
      }
    });
  }

  @override
  Future<void> updateMembersLocal(List<GroupMember> updated) async {
    emit(const GroupDetailsInitial());
    List<GroupMember> newMembers = await repo.updateMembersLocal(
      updated,
      group,
    );
    members = newMembers;
    emit(GetMembersSuccessState(members));
  }

  @override
  Future<void> removeMember(GroupMember member) async {
    await handleStatusEmit<void>(
      statusFunction: () => repo.removeMember(member, group),
      successFunction: (_) {
        members.remove(member);
        updateMembersLocal(members);
      },
    );
  }

  @override
  Future<void> changeAdmin(bool makeAdmin, GroupMember member) async {
    await handleStatusEmit<void>(
      statusFunction: () => repo.changeAdmin(makeAdmin, member, group),
      successFunction: (_) {
        int i = members.indexWhere((e) => e.memberId == member.memberId);
        members[i] = members[i].copyWith(isAdmin: makeAdmin);

        updateMembersLocal(members);
      },
    );
  }

  @override
  Future<void> changeInteraction(bool canInteract, int memberId) async {
    await handleStatusEmit<void>(
      statusFunction: () => repo.changeInteraction(
        canInteract,
        memberId,
        group,
      ),
      successFunction: (_) {
        int i = members.indexWhere((e) => e.memberId == memberId);
        members[i] = members[i].copyWith(canInteraction: canInteract);

        updateMembersLocal(members);
      },
    );
  }

  @override
  Future<void> changePermissions(
    GroupDiscussionType? discussionType,
    GroupAccessType? accessType,
  ) async {
    emit(const ChangePermissionsLoadingState());
    final GroupPermissionsParams params = GroupPermissionsParams(
      adminId: group.memberEntity.user.id,
      groupId: group.groupId,
      discussionType: discussionType,
      accessType: accessType,
    );
    await handleStatusEmit<void>(
      statusFunction: () => repo.changePermissions(params),
      successFunction: (_) async {
        group = group.copyWith(
          accessType: accessType,
          discussion: discussionType,
        );
        await ProviderDependency.group.updateGroup(group);
        emit(ChangePermissionsSuccessState(params));
      },
    );
  }
}
