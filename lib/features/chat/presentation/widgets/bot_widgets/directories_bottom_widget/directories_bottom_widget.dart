import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../cubit/bot_cubit/bot_cubit.dart';
import 'bottom_slider_button.dart';
import 'directories_buttons.dart';

class DirectoriesBottomWidget extends StatelessWidget {
  const DirectoriesBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BOTCubit c = ProviderDependency.bot;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return BlocBuilder<BOTCubit, BOTState>(
          buildWhen: (p, c) => c is ChangeDirectoryBottomHeightState,
          builder: (context, state) {
            return SizedBox(
              height:
                  isKeyboardVisible || c.isNoDirectories ? 0 : c.bottomHeight,
              width: double.infinity,
              child: const Column(
                children: [
                  BottomSliderButton(),
                  DirectoriesButtons(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
