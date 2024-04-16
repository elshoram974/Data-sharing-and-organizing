import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/directory_entity.dart';
import '../../../cubit/bot_cubit/directories_cubit/directories_cubit.dart';
import 'directories_back_button.dart';

class DirectoriesButtons extends StatelessWidget {
  const DirectoriesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final DirectoryCubit c = ProviderDependency.directory;

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 0.5 * AppConst.defaultPadding,
          bottom: 60,
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
        ),
        child: BlocBuilder<DirectoryCubit, DirectoryState>(
          buildWhen: (p, c) => c is OpenDirectoryState,
          builder: (context, state) {
            return FlexList(
              horizontalSpacing: 0.5 * AppConst.defaultPadding,
              verticalSpacing: 20,
              children: [
                ...List.generate(
                  c.currentDirectories.length,
                  (i) {
                    final DirectoryEntity dir = c.currentDirectories[i];
                    return Visibility(
                      visible: dir.isAccepted ||
                          c.groupCubit.isAdmin ||
                          dir.createdBy.id ==
                              ProviderDependency.userMain.user.id,
                      child: SizedBox(
                        height: 38,
                        child: MyFilledButton(
                          onPressed: () => c.openDirectory(dir),
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
                DirectoriesBackButton(cubit: c)
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
  DirectoryEntity dir,
  DirectoryCubit c,
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
    if (!dir.isAccepted) {
      content = S.of(_).userWantToAddDirectory(dir.name, dir.createdBy.name);
      actions.insertAll(
        0,
        [
          TextButton(
            onPressed: () => c.blockUserInteraction(dir.createdBy),
            child: Text(S.of(_).blockThisUser),
          ),
          TextButton(
            onPressed: () => c.addDirectory(dir),
            child: Text(S.of(_).addDirectory),
          ),
        ],
      );
    } else {
      content = S.of(_).whatDoYouWantToDoWithDirNameDirectory(dir.name);
      actions.insert(
        0,
        TextButton(
          onPressed: () => c.hideDirectory(dir),
          child: Text(S.of(_).hide),
        ),
      );
    }
  } else {
    if (ProviderDependency.userMain.user.id != dir.createdBy.id ||
        dir.isAccepted) return;
    content = S.of(_).youAddedDirNameDirectory(dir.name);
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
