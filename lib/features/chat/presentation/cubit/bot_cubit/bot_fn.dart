import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../../domain/entities/directory_entity.dart';
import '../../widgets/bot_widgets/add_data/add_activity_directory_dialog_widget.dart';
import '../../widgets/bot_widgets/add_data/add_activity_widget.dart';
import '../../widgets/bot_widgets/add_data/add_directory_widget.dart';
import '../group_cubit/group_cubit.dart';
import 'bot_cubit.dart';
import 'directories_cubit/directories_cubit.dart';

void deleteDirectoryDialog({
  required BuildContext context,
  required DirectoryEntity dir,
  required void Function() deleteFn,
}) {
  Navigator.pop(context);
  ShowCustomDialog.warning(
    context,
    body: S.of(context).itWillDeleteAllActivitiesInsideDirNameToo(dir.name),
    textConfirm: S.of(context).delete,
    onPressConfirm: deleteFn,
  );
}

void hideDirectoryDialog({
  required BuildContext context,
  required DirectoryEntity dir,
  required void Function() hideFn,
}) {
  Navigator.pop(context);
  ShowCustomDialog.warning(
    context,
    body: S.of(context).itWillMarkDirNameAsNotApprovedHidden(dir.name),
    textConfirm: S.of(context).hide,
    onPressConfirm: hideFn,
  );
}

void makeDirectoryApprovedDialog({
  required BuildContext context,
  required DirectoryEntity dir,
  required void Function() approveFn,
}) {
  Navigator.pop(context);
  ShowCustomDialog.warning(
    context,
    body: S.of(context).itWillApproveDirectoryNameDirectory(dir.name),
    textConfirm: S.of(context).addDirectory,
    onPressConfirm: approveFn,
  );
}

void blockUserInteractionDialog({
  required BuildContext context,
  required AuthUserEntity user,
  required void Function() blockFn,
}) {
  Navigator.pop(context);
  ShowCustomDialog.warning(
    context,
    body: S.of(context).youAreAboutToBlockMember(user.name, user.email),
    textConfirm: S.of(context).blockThisUser,
    onPressConfirm: blockFn,
  );
}

// -----------------------

void deleteActivityDialog({
  required BuildContext context,
  required ActivityEntity activity,
  required void Function() deleteFn,
}) {
  Navigator.pop(context);
  ShowCustomDialog.warning(
    context,
    body: S.of(context).itWillDeleteActivity(activity.content),
    textConfirm: S.of(context).delete,
    onPressConfirm: deleteFn,
  );
}

void hideActivityDialog({
  required BuildContext context,
  required ActivityEntity activity,
  required void Function() hideFn,
}) {
  Navigator.pop(context);
  ShowCustomDialog.warning(
    context,
    body: S.of(context).itWillMakeActivityNotApprovedHidden(activity.content),
    textConfirm: S.of(context).hide,
    onPressConfirm: hideFn,
  );
}

void makeActivityApprovedDialog({
  required BuildContext context,
  required ActivityEntity activity,
  required void Function() approveFn,
}) {
  Navigator.pop(context);
  ShowCustomDialog.warning(
    context,
    body: S.of(context).itWillApproveActivity(activity.content),
    textConfirm: S.of(context).addActivity,
    onPressConfirm: approveFn,
  );
}

void showActivityActions(
  BuildContext _,
  ActivityEntity activity,
) {
  final DirectoryCubit c = ProviderDependency.directory;
  final BOTCubit bot = ProviderDependency.bot;
  final String content;
  final List<TextButton> actions = [
    TextButton(
      onPressed: () => bot.deleteActivity(activity, _),
      child: Text(S.of(_).delete),
    ),
    TextButton(
      onPressed: Navigator.of(_).pop,
      child: Text(S.of(_).cancel),
    ),
  ];

  if (ProviderDependency.group.isAdmin) {
    if (!activity.isApproved) {
      content = S.of(_).userWantToAddActivity(
          activity.content, activity.createdBy.user.name);
      actions.insertAll(
        0,
        [
          if (!activity.createdBy.isAdmin)
            TextButton(
              onPressed: () => c.botCubit.blockUserInteraction(activity, _),
              child: Text(S.of(_).blockThisUser),
            ),
          TextButton(
            onPressed: () => bot.approvedActivity(activity, _),
            child: Text(S.of(_).addActivity),
          ),
        ],
      );
    } else {
      content = S.of(_).whatDoYouWantToDoWithThisActivity(activity.content);
      actions.insert(
        0,
        TextButton(
          onPressed: () => bot.hideActivity(activity, _),
          child: Text(S.of(_).hide),
        ),
      );
    }
  } else {
    content = S.of(_).youAddedActivityName(activity.content);
  }

  _showDialog(_, content, actions);
}

void showDirectoryActions(
  BuildContext _,
  DirectoryEntity dir,
  DirectoryCubit c,
) {
  final String content;
  final List<TextButton> actions = [
    TextButton(
      onPressed: () => c.deleteDirectory(dir, _),
      child: Text(S.of(_).delete),
    ),
    TextButton(
      onPressed: Navigator.of(_).pop,
      child: Text(S.of(_).cancel),
    ),
  ];

  if (c.groupCubit.isAdmin) {
    if (!dir.isApproved) {
      content =
          S.of(_).userWantToAddDirectory(dir.name, dir.createdBy.user.name);
      actions.insertAll(
        0,
        [
          if (!dir.createdBy.isAdmin)
            TextButton(
              onPressed: () => c.blockUserInteraction(dir, _),
              child: Text(S.of(_).blockThisUser),
            ),
          TextButton(
            onPressed: () => c.makeDirectoryApproved(dir, _),
            child: Text(S.of(_).addDirectory),
          ),
        ],
      );
    } else {
      content = S.of(_).whatDoYouWantToDoWithDirNameDirectory(dir.name);
      actions.insert(
        0,
        TextButton(
          onPressed: () => c.hideDirectory(dir, _),
          child: Text(S.of(_).hide),
        ),
      );
    }
  } else {
    if (ProviderDependency.userMain.user.id != dir.createdBy.user.id ||
        dir.isApproved) return;
    content = S.of(_).youAddedDirNameDirectory(dir.name);
  }

  _showDialog(_, content, actions);
}

Future<void> _showDialog(
    BuildContext _, String content, List<TextButton> actions) {
  return showDialog<void>(
    context: _,
    builder: (context) {
      return AlertDialog(
        content: Text(content),
        actions: actions,
      );
    },
  );
}

void addNewActivity(BuildContext context) {
  final GroupCubit c = ProviderDependency.group;
  if (c.group.memberEntity.isAdmin) {
    _addActivityDialog(context);
  } else {
    if (!c.group.memberEntity.canInteract) return;
    if (c.group.accessType == GroupAccessType.readWrite) {
      _addActivityDialog(context);
    } else {
      _addDataDialogForNoAdmin(context: context, isDirectory: false);
    }
  }
}

void addNewDirectory(BuildContext context) {
  final GroupCubit c = ProviderDependency.group;
  if (c.group.memberEntity.isAdmin) {
    _addDirectoryDialog(context);
  } else {
    if (c.group.accessType == GroupAccessType.readWrite) {
      _addDirectoryDialog(context);
    } else {
      _addDataDialogForNoAdmin(context: context, isDirectory: true);
    }
  }
}

void _addDataDialogForNoAdmin({
  required BuildContext context,
  required bool isDirectory,
}) {
  final String text;
  final GroupCubit c = ProviderDependency.group;

  if (c.group.accessType == GroupAccessType.readWriteWithAdminPermission) {
    text = S.of(context).yourDataWillBeAwaitingApproval;
  } else if (c.group.accessType == GroupAccessType.onlyRead) {
    text = S.of(context).onlyAdminsCanAddNewData;
  } else {
    text = S.of(context).youCanNowAddAnything;
  }
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(text),
        actions: [
          if (c.group.accessType != GroupAccessType.onlyRead)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isDirectory) {
                  _addDirectoryDialog(context);
                } else {
                  _addActivityDialog(context);
                }
              },
              child: Text(isDirectory
                  ? S.of(context).addDirectory
                  : S.of(context).addActivity),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).cancel),
          ),
        ],
      );
    },
  );
}

void _addActivityDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AddActivityOrDirectoryDialogWidget(
        content: const AddActivityWidget(),
        addButton: TextButton(
          onPressed: ProviderDependency.directory.addNewActivity,
          child: Text(S.of(context).addActivity),
        ),
      );
    },
  );
}

void _addDirectoryDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AddActivityOrDirectoryDialogWidget(
        content: const AddDirectoryWidget(),
        addButton: TextButton(
          onPressed: ProviderDependency.directory.addNewDirectory,
          child: Text(S.of(context).addDirectory),
        ),
      );
    },
  );
}
