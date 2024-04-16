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
                          dir.createdById ==
                              ProviderDependency.userMain.user.id,
                      child: SizedBox(
                        height: 38,
                        child: MyFilledButton(
                          onPressed: () => c.openDirection(dir),
                          onLongPress: () => _showAction(context, dir, c),
                          text: dir.name,
                          filledColor: dir.isAccepted
                              ? null
                              : AppColor.grayLightDark(context),
                          style:
                              AppStyle.styleBoldInika16.copyWith(height: 0.8),
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
}

void _showAction(
  BuildContext _,
  DirectionEntity dir,
  BOTCubit c,
) {
  final String content;
  final List<TextButton> actions = [
    TextButton(
      onPressed: () => c.deleteDirectory(dir),
      child: Text(S.of(_).delete),
    ),
    TextButton(
      onPressed: Navigator.of(_).pop,
      child: Text(S.of(_).cancel),
    ),
  ];

  if (c.groupCubit.isAdmin) {
    content =
        S.of(_).userIdWantToAddDirNameDirection(dir.name, dir.createdById);
    actions.insertAll(
      0,
      [
        TextButton(
          onPressed: () => c.blockUserInteraction(dir.createdById),
          child: Text(S.of(_).blockThisUser),
        ),
        TextButton(
          onPressed: () => c.addDirectory(dir),
          child: Text(S.of(_).addDirectory),
        ),
      ],
    );
  } else {
    if (ProviderDependency.userMain.user.id != dir.createdById) return;
    content = S.of(_).youAddedDirNameDirection(dir.name);
  }

  showDialog<void>(
    context: _,
    builder: (context) {
      return AlertDialog(
        content: Text(content),
        actions: actions,
      );
    },
  );
}
