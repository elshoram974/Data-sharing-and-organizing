import 'package:data_sharing_organizing/core/shared/expandable_fab.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/group_cubit/group_cubit.dart';
import '../my_attachment_button.dart';

class BotFAB extends StatelessWidget {
  const BotFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupCubit c = ProviderDependency.group;

    return BlocBuilder<GroupCubit, GroupState>(
      buildWhen: (p, c) => c is GroupChooseScreenState,
      builder: (context, state) {
        return c.currentScreen == 0
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
                    onPressed: () => _showAction(context, "U can add directory here"),
                    icon: const Icon(Icons.create_new_folder_outlined),
                  ),
                  ActionButton(
                    tooltip: S.of(context).addFileOrMessage,
                    onPressed: () => _showAction(context, "U can add file here"),
                    icon: const MyAttachmentButtonIcon(iconColor: null),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  void _showAction(BuildContext context, String title) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(title),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}
