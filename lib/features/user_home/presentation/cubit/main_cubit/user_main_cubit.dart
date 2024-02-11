import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../auth/domain/usecases/log_out_use_case.dart';

part 'user_main_state.dart';

class UserMainCubit extends Cubit<UserMainState> {
  UserMainCubit({
    required this.logOutUseCase,
    required this.user,
  }) : super(const UserMainInitial());
  final AuthUserEntity user;
  final LogOutUseCase logOutUseCase;

  PageController navController = PageController();
  int navIndex = 0;

  void onNavChange(int val, bool inPageChange) {
    navIndex = val;
    if (!inPageChange) navController.jumpToPage(navIndex);
    emit(UserMainChangeNavBar(navIndex));
  }

  void logOut() => logOutUseCase();

  @override
  Future<void> close() {
    navController.dispose();
    return super.close();
  }
}
