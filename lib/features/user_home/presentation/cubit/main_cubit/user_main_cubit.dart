import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';

part 'user_main_state.dart';

class UserMainCubit extends Cubit<UserMainState> {
  UserMainCubit(this.user) : super(const UserMainInitial());
  final AuthUserEntity user;

  int navIndex = 0;

  void onNavChange(int val) {
    navIndex = val;
    emit(UserMainChangeNavBar(navIndex));
  }
}
