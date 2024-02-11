part of 'user_home_cubit.dart';

abstract class UserHomeState extends Equatable {
  const UserHomeState();

  @override
  List<Object> get props => [];
}

class UserHomeInitial extends UserHomeState {
  const UserHomeInitial();
}

class UserHomeChangeNavBar extends UserHomeState {
  final int navIndex;
  const UserHomeChangeNavBar(this.navIndex);
  @override
  List<int> get props => [navIndex];
}
