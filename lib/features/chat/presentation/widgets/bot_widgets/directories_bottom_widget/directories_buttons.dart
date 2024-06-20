import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/directory_entity.dart';
import '../../../cubit/bot_cubit/bot_fn.dart';
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
          buildWhen: (p, c) =>
              c is OpenDirectoryState || c is DeleteDirectoryState,
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
                      visible: dir.isApproved ||
                          c.groupCubit.isAdmin ||
                          dir.createdBy.user.id ==
                              ProviderDependency.userMain.user.id,
                      child: SizedBox(
                        height: 38,
                        child: MyFilledButton(
                          onPressed: () => c.openDirectory(dir),
                          onLongPress: () =>
                              showDirectoryActions(context, dir, c),
                          text: dir.name,
                          filledColor: dir.isApproved
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
