import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
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
          bottom: 60,
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
                    return Visibility(
                      visible: dir.isAccepted ||
                          c.groupCubit.isAdmin ||
                          dir.createdById ==  ProviderDependency.userMain.user.id,
                      child: SizedBox(
                        height: 38,
                        child: MyFilledButton(
                          onPressed: () => c.openDirection(dir),
                          onLongPress: () =>
                              _showAction(context, dir, c.groupCubit.isAdmin),
                          text: dir.name,
                          filledColor: dir.isAccepted
                              ? null
                              : AppColor.grayLightDark(context),
                          style: AppStyle.styleBoldInika16.copyWith(height: 0.8),
                        ),
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

  void _showAction(
    BuildContext context,
    DirectionEntity dir,
    bool isAdmin,
  ) {
    final String content;
    final List<Widget> actions = [
      TextButton(
        onPressed: () {}, // TODO: delete it
        child: Text(S.of(context).delete),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(S.of(context).cancel),
      ),
    ];

    if (isAdmin) {
      content = "user id '${dir.createdById}' want to add '${dir.name}' direction";
      actions.insertAll(
        0,
        [
          TextButton(
            onPressed: () {}, // TODO: block it
            child: const Text('Block this user'), // TODO: add lang
          ),
          TextButton(
            onPressed: () {}, // TODO: add it
            child: Text(S.of(context).addDirectory),
          ),
        ],
      );
    } else {
      content = "U added '${dir.name}' direction ";
    }

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(content),
          actions: actions,
        );
      },
    );
  }
}
