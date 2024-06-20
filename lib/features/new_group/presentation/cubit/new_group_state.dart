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
  const SearchMembersLoadingState();
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
