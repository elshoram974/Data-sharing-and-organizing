import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/group_cubit/group_cubit.dart';
import 'select_bot_button.dart';

class GroupFloatingButtonWidget extends StatelessWidget {
  const GroupFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupCubit c = ProviderDependency.group;

    return BlocBuilder<GroupCubit, GroupState>(
      buildWhen: (p, c) =>
          c is GroupOpenFloatingButtonState || c is GroupChooseScreenState,
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 92,
          width: c.isOpened ? 134 : 16,
          decoration: const BoxDecoration(
            color: AppColor.active,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(AppConst.borderRadius),
            ),
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: c.isOpened ? 1 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SelectBotButton(
                  text: 'BOT',
                  onPressed: c.isOpened ? () => c.onChooseScreen(0) : null,
                  backgroundColor: c.currentScreen == 0
                      ? AppColor.primary
                      : AppColor.grayLightDark(context),
                ),
                SelectBotButton(
                  text: 'Chat',
                  onPressed: c.isOpened ? () => c.onChooseScreen(1) : null,
                  backgroundColor: c.currentScreen == 1
                      ? AppColor.primary
                      : AppColor.grayLightDark(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
