import 'package:data_sharing_organizing/core/shared/expandable_fab.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../cubit/bot_cubit/bot_fn.dart';
import '../../cubit/group_cubit/group_cubit.dart';
import '../my_attachment_button.dart';

class BotFAB extends StatelessWidget {
  const BotFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupCubit c = ProviderDependency.group;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return BlocBuilder<GroupCubit, GroupState>(
        buildWhen: (p, c) => c is GroupChooseScreenState,
        builder: (context, state) {
          return c.currentScreen == 0 &&
                  ((c.group.accessType != GroupAccessType.onlyRead &&
                          c.group.memberEntity.canInteract) ||
                      c.isAdmin) &&
                  !isKeyboardVisible
              ? ExpandableFab(
                  distance: 70,
                  degreeStart: 0,
                  fab: const FloatingActionButton(
                    onPressed: null, // مهما حطيت فملوش لازمة
                    mini: true,
                    backgroundColor: AppColor.active,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  children: [
                    ActionButton(
                      tooltip: S.of(context).addDirectory,
                      onPressed: () => addNewDirectory(context),
                      icon: const Icon(Icons.create_new_folder_outlined),
                    ),
                    ActionButton(
                      tooltip: S.of(context).addFileOrMessage,
                      onPressed: () => addNewActivity(context),
                      icon: const MyAttachmentButtonIcon(iconColor: null),
                    ),
                  ],
                )
              : const SizedBox.shrink();
        },
      );
    });
  }
}
