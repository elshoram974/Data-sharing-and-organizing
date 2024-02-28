part of 'user_home_cubit.dart';

sealed class UserHomeState extends Equatable {
  const UserHomeState();

  @override
  List<Object> get props => [];
}

final class UserHomeInitial extends UserHomeState {
  const UserHomeInitial(this.groups);

  final List<GroupHomeEntity> groups;
  @override
  List<Object> get props => [groups];
}

final class UserHomeSelectGroup extends UserHomeState {
  const UserHomeSelectGroup(this.groups, this.makeSelected);

  final List<GroupHomeEntity> groups;
  final bool makeSelected;

  @override
  List<Object> get props => [groups, makeSelected];
}
