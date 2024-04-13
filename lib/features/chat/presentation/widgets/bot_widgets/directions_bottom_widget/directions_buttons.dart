import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/direction_entity.dart';
import '../../../cubit/bot_cubit/bot_cubit.dart';
import 'directions_back_button.dart';

class DirectionsButtons extends StatelessWidget {
  const DirectionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final BOTCubit c = ProviderDependency.bot;

    return Expanded(
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
  }
}
