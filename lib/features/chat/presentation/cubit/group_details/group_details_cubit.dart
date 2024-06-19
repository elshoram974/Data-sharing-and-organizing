import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../data/models/group_details_members/group_members_model.dart';
import '../../../domain/repositories/group_details_repo.dart';

part 'group_details_state.dart';

abstract class GroupDetailsCubit extends Cubit<GroupDetailsState> {
  GroupDetailsCubit() : super(const GroupDetailsInitial());

  List<GroupMember> members = [];

  Future<void> getMembers();
}

class GroupDetailsCubitImp extends GroupDetailsCubit {
  GroupDetailsCubitImp({
    required this.group,
    required this.groupDetailsRepo,
  }) {
    getMembers();
  }
  final GroupHomeEntity group;
  final GroupDetailsRepositories groupDetailsRepo;

  @override
  Future<void> getMembers() async {
    emit(const MembersLoadingState());
    Status<List<GroupMember>>? status;
    groupDetailsRepo
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
}
