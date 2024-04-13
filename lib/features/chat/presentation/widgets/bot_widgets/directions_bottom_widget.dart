import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../domain/entities/direction_entity.dart';
import '../../cubit/bot_cubit/bot_cubit.dart';
import 'directions_back_button.dart';

class DirectionsBottomWidget extends StatelessWidget {
  const DirectionsBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BOTCubit c = ProviderDependency.bot;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return BlocBuilder<BOTCubit, BOTState>(
          buildWhen: (p, c) => c is ChangeDirectionBottomHeightState,
          builder: (context, state) {
            return SizedBox(
              height: isKeyboardVisible ? 0 : c.bottomHeight,
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onVerticalDragUpdate: (d) => c.changeHeight(d, context),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(0.5 * AppConst.defaultPadding),
                      color: AppColor.background(context),
                      child: Container(
                        width: 80,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColor.active,
                          borderRadius:
                              BorderRadius.circular(AppConst.borderRadius),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 0.5 * AppConst.defaultPadding,
                        bottom: AppConst.defaultPadding,
                        left: AppConst.defaultPadding,
                        right: AppConst.defaultPadding,
                      ),
                      child: BlocBuilder<BOTCubit, BOTState>(
                        buildWhen: (p, c) => c is OpenDirectionState,
                        builder: (context, state) {
                          return FlexList(
                            horizontalSpacing: 0.5 * AppConst.defaultPadding,
                            verticalSpacing: 20,
                            children: [
                              ...List.generate(
                                c.currentDirections.length,
                                (i) {
                                  final DirectionEntity dir =
                                      c.currentDirections[i];
                                  return SizedBox(
                                    height: 38,
                                    child: MyFilledButton(
                                      onPressed: () => c.openDirection(dir),
                                      text: dir.name,
                                      style: AppStyle.styleBoldInika16
                                          .copyWith(height: 0.8),
                                    ),
                                  );
                                },
                              ),
                              DirectionsBackButton(botCubit: c)
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
