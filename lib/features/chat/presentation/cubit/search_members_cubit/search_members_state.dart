part of 'search_members_cubit.dart';

abstract class SearchMembersState extends Equatable {
  const SearchMembersState();

  @override
  List<Object?> get props => [];
}

class SearchMembersInitial extends SearchMembersState {
  const SearchMembersInitial();
}

class SearchMembersLoadingState extends SearchMembersState {
  const SearchMembersLoadingState();
}

class SearchMembersSuccessState extends SearchMembersState {
  const SearchMembersSuccessState(this.members);
  final List<SearchedMemberModel> members;

  @override
  List<Object?> get props => [members];
}

class SearchMembersFailureState extends SearchMembersState {
  const SearchMembersFailureState(this.failure);
  final FailureBody failure;

  @override
  List<Object?> get props => [failure];
}
