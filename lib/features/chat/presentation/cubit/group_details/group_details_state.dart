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
