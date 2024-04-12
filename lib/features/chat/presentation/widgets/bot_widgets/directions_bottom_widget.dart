import 'package:data_sharing_organizing/core/shared/filled_button.dart';
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
        return Container(
          height: isKeyboardVisible ? 0 : 250,
          width: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
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
                        final DirectionEntity dir = c.currentDirections[i];
                        return SizedBox(
                          height: 38,
                          child: MyFilledButton(
                            onPressed: () => c.openDirection(dir),
                            text: dir.name,
                            style: AppStyle.styleBoldInika16.copyWith(height: 0.8),
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
        );
      },
    );
  }
}
