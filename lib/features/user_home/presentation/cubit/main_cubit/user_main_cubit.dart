import 'dart:async';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/services/notification/local_notification.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hive/hive.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../auth/domain/usecases/log_out_use_case.dart';
import '../../../../chat/data/models/activity_model.dart';
import '../../../../chat/presentation/cubit/group_cubit/group_cubit.dart';
import '../../../domain/entities/group_home_entity.dart';

part 'user_main_state.dart';

class UserMainCubit extends Cubit<UserMainState> {
  UserMainCubit({
    required this.logOutUseCase,
    required this.user,
  }) : super(const UserMainInitial()) {
    localNotificationHandler();
  }
  AuthUserEntity user;
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
      onPressConfirm: () => logoutWithoutDialog(context),
    );
  }

  void logoutWithoutDialog(BuildContext context) async {
    EasyLoading.show(dismissOnTap: false);
    navIndex = 0;
    final Status<void> status = await logOutUseCase();
    if (status is Success<void>) {
      if (context.mounted) context.go(AppRoute.login);
    }
    EasyLoading.dismiss();
  }

  void localNotificationHandler() {
    LocalNotification.onClick.stream.listen(
      (data) {
        final NotificationType type = NotificationType.fromString(data['type']);
        final Iterable<GroupHomeEntity> groups =
            Hive.box<GroupHomeEntity>(AppStrings.groupsBox).values;
        switch (type) {
          case NotificationType.message:
            final types.Message message =
                types.Message.fromJson(data[data['type']]);
            final extra = groups
                .where((e) => e.id == message.metadata?['group_id'])
                .first
                .copyWith(screen: 1);
            if (isGroupScreenOpened) {
              AppRoute.key.currentContext?.pushReplacement(
                AppRoute.group,
                extra: extra,
              );
            } else {
              AppRoute.key.currentContext?.push(
                AppRoute.group,
                extra: extra,
              );
            }
            break;
          case NotificationType.activity:
            final ActivityModel activity =
                ActivityModel.fromJson(data[data['type']]);
            final extra = groups
                .where((e) => e.id == activity.groupId)
                .first
                .copyWith(screen: 0);
            if (isGroupScreenOpened) {
              AppRoute.key.currentContext?.pushReplacement(
                AppRoute.group,
                extra: extra,
              );
            } else {
              AppRoute.key.currentContext?.push(
                AppRoute.group,
                extra: extra,
              );
            }
            break;
          case NotificationType.info:
          default:
            AppRoute.key.currentContext?.go(AppRoute.userHome);
            onNavChange(1, false);
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
