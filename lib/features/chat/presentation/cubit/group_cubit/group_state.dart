part of 'group_cubit.dart';

abstract class GroupState extends Equatable {
  const GroupState();

  @override
  List<Object> get props => [];
}

class GroupInitial extends GroupState {
  const GroupInitial();
}

class GroupOpenFloatingButtonState extends GroupState {
  const GroupOpenFloatingButtonState(this.openIt);
  final bool openIt;
  @override
  List<bool> get props => [openIt];
}

class GroupChooseScreenState extends GroupState {
  const GroupChooseScreenState(this.currentScreen);
  final int currentScreen;
  @override
  List<int> get props => [currentScreen];
}

class GroupChangeButtonPlaceState extends GroupState {
  const GroupChangeButtonPlaceState(this.top);
  final double top;
  @override
  List<double> get props => [top];
}

class GroupUpdateGroupDetails extends GroupState {
  const GroupUpdateGroupDetails(this.group);
  final GroupHomeEntity group;
  @override
  List<Object> get props => [group];
}
