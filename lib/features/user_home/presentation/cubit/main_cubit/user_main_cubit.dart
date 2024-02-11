import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';

part 'user_main_state.dart';

class UserMainCubit extends Cubit<UserMainState> {
  UserMainCubit(this.user) : super(const UserMainInitial());
  final AuthUserEntity user;

  PageController navController = PageController();
  int navIndex = 0;

  void onNavChange(int val, bool inPageChange) {
    navIndex = val;
    if (!inPageChange) navController.jumpToPage(navIndex);
    emit(UserMainChangeNavBar(navIndex));
  }

  @override
  Future<void> close() {
    navController.dispose();
    return super.close();
  }
}
