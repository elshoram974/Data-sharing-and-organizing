import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../../domain/entities/directory_entity.dart';
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
    body: "it will delete all activities that inside '${dir.name}' too",
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
    body:
        "it will make '${dir.name}' directory not approved that will hide it , and u can make it approved again",
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
    body:
        "it will make '${dir.name}' directory approved and all members can see it",
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
    body: "u r going to block '${user.name}' member with email '${user.email}'.\n it just make him won\'t be able to add anything to bot",
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
    body: "it will delete '${activity.content}' activity",
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
    body:
        "it will make '${activity.content}' activity not approved that will hide it , and u can make it approved again",
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
    body:
        "it will make '${activity.content}' activity approved and all members can see it",
    textConfirm: S.of(context).addDirectory,
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
      content = S.of(_).userWantToAddActivity(activity.content, activity.createdBy.user.name);
      actions.insertAll(
        0,
        [
          TextButton(
            onPressed: () => c.blockUserInteraction(activity.createdBy.user, _),
            child: Text(S.of(_).blockThisUser),
          ),
          TextButton(
            onPressed:  () => bot.approvedActivity(activity, _),
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
    if (ProviderDependency.userMain.user.id != activity.createdBy.user.id ||
        activity.isApproved) return;
    content = S.of(_).youAddedActivityName(activity.content);
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