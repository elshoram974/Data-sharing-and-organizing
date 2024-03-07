part of 'user_home_cubit.dart';

sealed class UserHomeState extends Equatable {
  const UserHomeState();

  @override
  List<Object> get props => [];
}

final class UserHomeInitial extends UserHomeState {
  const UserHomeInitial();
}

final class UserHomeSelectGroups extends UserHomeState {
  const UserHomeSelectGroups(this.groups, this.makeSelected);

  final List<GroupHomeEntity> groups;
  final bool makeSelected;

  @override
  List<Object> get props => [groups, makeSelected];
}

final class GetGroupsLoadingState extends UserHomeState {
  const GetGroupsLoadingState();
}

final class HomeSuccessState extends UserHomeState {
  const HomeSuccessState(this.groups);

  final List<GroupHomeEntity> groups;

  @override
  List<Object> get props => [groups];
}

final class HomeFailureState extends UserHomeState {
  const HomeFailureState(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
