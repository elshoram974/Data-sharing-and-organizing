import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

  final GlobalKey pageKey = GlobalKey();
  final PageController navController = PageController();
  int navIndex = 0;

  void onNavChange(int val, bool inPageChange) {
    ProviderDependency.userHome.onWillPop();
    navIndex = val;
    if (!inPageChange) navController.jumpToPage(navIndex);
    emit(UserMainChangeNavBar(navIndex));
  }

  void logOut() async {
    final BuildContext context = AppRoute.key.currentContext!;

    ShowCustomDialog.warning(
      context,
      body: S.of(context).ifYouLogOutNowYouWillLoseAllUnsavedData,
      textConfirm: S.of(context).logout,
      textCancel: S.of(context).cancel,
      onPressConfirm: () async {
        navIndex = 0;
        final Status<int> status = await logOutUseCase();
        if (status is Success<int>) {
          if (context.mounted) context.go(AppRoute.login);
        }
      },
    );
  }

  @override
  Future<void> close() {
    navController.dispose();
    return super.close();
  }

  bool onWillPop() {
    if (!ProviderDependency.userHome.onWillPop()) return false;
    if (navIndex != 0) {
      onNavChange(0, false);
      return false;
    }
    return true;
  }
}
