part of 'user_main_cubit.dart';

abstract class UserMainState extends Equatable {
  const UserMainState();

  @override
  List<Object> get props => [];
}

class UserMainInitial extends UserMainState {
  const UserMainInitial();
}

class UserMainChangeNavBar extends UserMainState {
  final int navIndex;
  const UserMainChangeNavBar(this.navIndex);
  @override
  List<int> get props => [navIndex];
}
