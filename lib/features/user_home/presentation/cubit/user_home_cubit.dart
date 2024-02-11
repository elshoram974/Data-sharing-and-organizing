import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(const UserHomeInitial());

  int navIndex = 0;

  void onNavChange(int val) {
    navIndex = val;
    emit(UserHomeChangeNavBar(navIndex));
  }
}
