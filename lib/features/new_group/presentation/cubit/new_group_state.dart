part of 'new_group_cubit.dart';

abstract class NewGroupState extends Equatable {
  const NewGroupState();

  @override
  List<Object?> get props => [];
}

class NewGroupInitial extends NewGroupState {
  const NewGroupInitial();
}

class SearchMembersLoadingState extends NewGroupState {
  const SearchMembersLoadingState(this.page);
  final int page;

  @override
  List<Object?> get props => [page];
}

class SearchMembersSuccessState extends NewGroupState {
  const SearchMembersSuccessState(this.members);
  final List<MemberListTileEntity> members;

  @override
  List<Object?> get props => [members];
}

class SearchMembersFailureState extends NewGroupState {
  const SearchMembersFailureState(this.failure);
  final FailureBody failure;

  @override
  List<Object?> get props => [failure];
}

class SelectMemberState extends NewGroupState {
  const SelectMemberState(this.member);
  final MemberListTileEntity member;

  @override
  List<Object?> get props => [member, member.isSelected];
}

class SelectImageState extends NewGroupState {
  const SelectImageState(this.path);
  final String? path;

  @override
  List<Object?> get props => [path];
}

class ChangeGroupAccessType extends NewGroupState {
  const ChangeGroupAccessType(this.accessType);
  final GroupAccessType accessType;

  @override
  List<Object?> get props => [accessType];
}

class ChangeGroupDiscussionType extends NewGroupState {
  const ChangeGroupDiscussionType(this.discussionType);
  final GroupDiscussionType discussionType;

  @override
  List<Object?> get props => [discussionType];
}
