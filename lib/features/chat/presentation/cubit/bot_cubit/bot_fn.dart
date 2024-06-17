import 'dart:math';
import 'dart:typed_data';

import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../data/models/attachment_model.dart';
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
  types.Message message,
) {
  final DirectoryCubit c = ProviderDependency.directory;
  final BOTCubit bot = ProviderDependency.bot;
  final String content;
  final List<TextButton> actions = [
    TextButton(
      onPressed: () => bot.deleteActivity(message, _),
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
              onPressed: () => c.botCubit.blockUserInteraction(message, _),
              child: Text(S.of(_).blockThisUser),
            ),
          TextButton(
            onPressed: () => bot.approvedActivity(message, _),
            child: Text(S.of(_).addActivity),
          ),
        ],
      );
    } else {
      content = S.of(_).whatDoYouWantToDoWithThisActivity(activity.content);
      actions.insert(
        0,
        TextButton(
          onPressed: () => bot.hideActivity(message, _),
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
        addButton: BlocBuilder<DirectoryCubit, DirectoryState>(
          buildWhen: (p, c) => c is ValidateActivityState,
          bloc: ProviderDependency.directory,
          builder: (context, state) {
            return TextButton(
              onPressed: ProviderDependency.directory.isValidActivity
                  ? ProviderDependency.directory.addNewActivity
                  : null,
              child: Text(S.of(context).addActivity),
            );
          },
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

Future<
    ({
      Uint8List file,
      ActivityEntity activity,
    })?> handleAttachmentPressed(BuildContext context) async {
  ({
    Uint8List file,
    ActivityEntity activity,
  })? temp;
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: SizedBox(
        height: 144,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                temp = await _handleImageSelection();
              },
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(S.of(context).photo),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                temp = await _handleFileSelection();
              },
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(S.of(context).file),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(S.of(context).cancel),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  return temp;
}

Future<
    ({
      Uint8List file,
      ActivityEntity activity,
    })?> _handleFileSelection() async {
  final DirectoryCubit dirCubit = ProviderDependency.directory;
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.any,
  );

  if (result != null) {
    return (
      file: await result.files.single.xFile.readAsBytes(),
      activity: ActivityEntity(
        id: Random().nextInt(9999),
        groupId: dirCubit.groupCubit.group.groupId,
        createdBy: dirCubit.botCubit.currentMember,
        content: result.files.single.name,
        createdAt: DateTime.now(),
        isApproved: false,
        type: MessageType.other,
        attachment: AttachmentModel(
          size: result.files.single.size.toDouble(),
          name: result.files.single.name,
          uri: result.files.single.path ?? '',
          mimeType: lookupMimeType(result.files.single.path ?? ''),
        ),
        insideDirectoryId: dirCubit.currentDirectories.lastOrNull?.id,
      ),
    );
  }
  return null;
}

Future<
    ({
      Uint8List file,
      ActivityEntity activity,
    })?> _handleImageSelection() async {
  final DirectoryCubit dirCubit = ProviderDependency.directory;
  final result = await ImagePicker().pickImage(
    maxWidth: 1440,
    source: ImageSource.gallery,
  );

  if (result != null) {
    final bytes = await result.readAsBytes();
    final image = await decodeImageFromList(bytes);

    return (
      file: bytes,
      activity: ActivityEntity(
        id: Random().nextInt(9999),
        groupId: dirCubit.groupCubit.group.groupId,
        createdBy: dirCubit.botCubit.currentMember,
        content: result.name,
        createdAt: DateTime.now(),
        isApproved: false,
        type: MessageType.photo,
        attachment: AttachmentModel(
          size: bytes.length.toDouble(),
          height: image.height.toDouble(),
          width: image.width.toDouble(),
          name: result.name,
          uri: result.path,
          mimeType: lookupMimeType(result.path),
        ),
        insideDirectoryId: dirCubit.currentDirectories.lastOrNull?.id,
      ),
    );
  }
  return null;
}
