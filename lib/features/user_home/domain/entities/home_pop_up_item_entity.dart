import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/home_selected_pop_up_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../presentation/cubit/user_home_cubit/user_home_cubit.dart';

final class HomePopUpItemEntity extends Equatable {
  final HomeSelectedPopUpItem value;
  final String text;
  final bool isVisible;

  const HomePopUpItemEntity({
    required this.text,
    required this.value,
    required this.isVisible,
  });
  @override
  List<Object?> get props => [value, text];

  static List<HomePopUpItemEntity> list(
    BuildContext context,
    UserHomeCubit cubit,
  ) {
    return [
      HomePopUpItemEntity(
        text: S.of(context).exitGroups,
        value: HomeSelectedPopUpItem.exitGroup,
        isVisible: true,
      ),
      HomePopUpItemEntity(
        text: S.of(context).markAsUnRead,
        value: HomeSelectedPopUpItem.markAsUnRead,
        isVisible: true,
      ),
      HomePopUpItemEntity(
        text: S.of(context).selectAll,
        value: HomeSelectedPopUpItem.selectAll,
        isVisible: !cubit.isAllSelected,
      ),
      HomePopUpItemEntity(
        text: S.of(context).deselectAll,
        value: HomeSelectedPopUpItem.deselectAll,
        isVisible: cubit.isAllSelected,
      ),
      HomePopUpItemEntity(
        text: S.of(context).muteNotification,
        value: HomeSelectedPopUpItem.muteNotification,
        isVisible: cubit.selectedGroups.length == 1 &&
            !cubit.selectedGroups.first.isMute,
      ),
      HomePopUpItemEntity(
        text: S.of(context).unmuteNotification,
        value: HomeSelectedPopUpItem.unmuteNotification,
        isVisible: cubit.selectedGroups.length == 1 &&
            cubit.selectedGroups.first.isMute,
      ),
    ];
  }
}
