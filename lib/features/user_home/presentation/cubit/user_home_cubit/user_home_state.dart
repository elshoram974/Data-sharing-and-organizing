part of 'user_home_cubit.dart';

sealed class UserHomeState extends Equatable {
  const UserHomeState();

  @override
  List<Object?> get props => [];
}

final class UserHomeInitial extends UserHomeState {
  const UserHomeInitial();
}

final class UserHomeUpdateGroup extends UserHomeState {
  const UserHomeUpdateGroup(this.group);

  final GroupHomeEntity group;

  @override
  List<Object?> get props => [
        group.groupId,
        group.groupName,
        group.ownerId,
        group.bottomHeight,
        group.lastActivity,
        group.isSelected,
        group.unReadCounter,
        group.memberEntity,
        group.discussion,
        group.accessType,
        group.createdAt,
        group.imageLink,
        group.screen,
      ];
}

final class UserHomeSelectGroups extends UserHomeState {
  const UserHomeSelectGroups(this.groups, this.makeSelected);

  final List<GroupHomeEntity> groups;
  final bool makeSelected;

  @override
  List<Object> get props => [groups, makeSelected];
}

final class GetGroupsLoadingState extends UserHomeState {
  final bool inFirst;
  const GetGroupsLoadingState(this.inFirst);
  @override
  List<Object> get props => [inFirst];
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

final class UpdateUI extends UserHomeState {
  const UpdateUI(this.i);

  final int? i;

  @override
  List<int?> get props => [i];
}
