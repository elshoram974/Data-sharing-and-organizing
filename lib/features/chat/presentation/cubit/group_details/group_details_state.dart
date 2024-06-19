part of 'group_details_cubit.dart';

sealed class GroupDetailsState extends Equatable {
  const GroupDetailsState();

  @override
  List<Object?> get props => [];
}

final class GroupDetailsInitial extends GroupDetailsState {
  const GroupDetailsInitial();
}

final class MembersLoadingState extends GroupDetailsState {
  const MembersLoadingState();
}

final class GetMembersSuccessState extends GroupDetailsState {
  const GetMembersSuccessState(this.members);
  final List<GroupMember> members;

  @override
  List<Object?> get props => [members];
}

class GetMembersFailureState extends GroupDetailsState {
  const GetMembersFailureState(this.failure);
  final FailureBody failure;

  @override
  List<Object?> get props => [failure];
}

class ChangePermissionsLoadingState extends GroupDetailsState {
  const ChangePermissionsLoadingState();
}

class ChangePermissionsSuccessState extends GroupDetailsState {
  const ChangePermissionsSuccessState(this.params);
  final GroupPermissionsParams params;

  @override
  List<Object?> get props => [params];
}

class ChangeGroupDataLoadingState extends GroupDetailsState {
  const ChangeGroupDataLoadingState();
}

class ChangeGroupDataSuccessState extends GroupDetailsState {
  const ChangeGroupDataSuccessState(this.params);
  final EditGroupParams params;

  @override
  List<Object?> get props => [params];
}

final class ProgressUploadingPhoto extends GroupDetailsState {
  const ProgressUploadingPhoto([this.value]);
  final double? value;

  @override
  List<Object?> get props => [value];
}