import 'dart:math';
import 'dart:typed_data';

import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import '../../../../data/models/activity_model.dart';
import '../../../../data/models/directory_model.dart';
import '../../../../domain/entities/activity_entity.dart';
import '../../../../domain/entities/data_in_directory.dart';
import '../../../../domain/entities/directory_entity.dart';
import '../../../../domain/repositories/bot_repo.dart';
import '../../group_cubit/group_cubit.dart';
import '../bot_cubit.dart';
import '../bot_fn.dart';

part 'directories_state.dart';

abstract class DirectoryCubit extends Cubit<DirectoryState> {
  DirectoryCubit() : super(const DirectoryInitial());

  final BOTCubit botCubit = ProviderDependency.bot;
  final GroupCubit groupCubit = ProviderDependency.group;

  final List<DirectoryEntity> _directoriesStack = [];
  List<DirectoryEntity> currentDirectories = [];

  late double bottomHeight = groupCubit.group.bottomHeight ?? 250;

  bool get canDirectoryPop => _directoriesStack.isNotEmpty;

  void changeHeight(DragUpdateDetails details, BuildContext _);

  void goToDirectory(DirectoryEntity? dir);
  void openDirectory(DirectoryEntity newDirectory);
  void closeLastDirectory();

  void deleteDirectory(DirectoryEntity dir, BuildContext _);
  void hideDirectory(DirectoryEntity dir, BuildContext _);
  void makeDirectoryApproved(DirectoryEntity dir, BuildContext _);
  void blockUserInteraction(DirectoryEntity dir, BuildContext _);

  void onPopInvoked(bool didPop);

  GlobalKey<FormFieldState<dynamic>> directoryNameKey =
      GlobalKey<FormFieldState<dynamic>>();
  void addNewDirectoryOnSave(String val);
  void addNewDirectory();

  String content = '';
  bool isValidActivity = false;

  GlobalKey<FormFieldState<dynamic>> activityKey =
      GlobalKey<FormFieldState<dynamic>>();
  void addNewActivity([({Uint8List file, ActivityEntity activity})? file]);
  void onChangeAct(String val) {
    content = val;
    isValidActivity = activityKey.currentState?.isValid ?? false;
    emit(ValidateActivityState(isValidActivity));
  }
}

class DirectoryCubitImp extends DirectoryCubit {
  final BOTRepositories botRepo;

  DirectoryCubitImp(this.botRepo) {
    _changeDirectory();
  }

  // * directories_height
  @override
  void changeHeight(DragUpdateDetails details, BuildContext _) async {
    bottomHeight += -details.delta.dy;
    final double maxHeight = MediaQuery.sizeOf(_).height - 250;
    const double minHeight = 50;

    if (bottomHeight < minHeight) {
      bottomHeight = minHeight;
    } else if (bottomHeight > maxHeight) {
      bottomHeight = maxHeight;
    }
    await ProviderDependency.userHome.updateGroupLocally(
        groupCubit.group.copyWith(bottomHeight: bottomHeight));

    emit(ChangeDirectoryBottomHeightState(bottomHeight));
  }
  // ----------------------------------------------------------------

  // * change directories --------------------------------
  @override
  void goToDirectory(DirectoryEntity? dir) {
    if (_directoriesStack.lastOrNull != dir) {
      if (dir == null) {
        _directoriesStack.clear();
      } else {
        _directoriesStack.add(dir);
      }
      return _changeDirectory();
    }
  }

  @override
  void openDirectory(DirectoryEntity newDirectory) {
    _directoriesStack.add(newDirectory);
    _changeDirectory();
  }

  @override
  void closeLastDirectory() {
    if (_directoriesStack.isEmpty) return;
    _directoriesStack.removeLast();
    _changeDirectory();
  }

  void _changeDirectory() {
    final DirectoryEntity? dir = _directoriesStack.lastOrNull;
    final ActivityModel activityTemp = ActivityModel.fromEntity(
      ActivityEntity(
        id: Random().nextInt(9999999),
        groupId: groupCubit.group.groupId,
        createdBy: botCubit.currentMember,
        content: _directoriesStack.lastOrNull?.name ?? S.current.home,
        createdAt: DateTime.now(),
        isApproved: true,
        type: MessageType.textMessage,
      ),
    );
    botCubit.addMessage(
      types.TextMessage(
        id: const Uuid().v4(),
        author: activityTemp.createdBy.messageAuthor(),
        text: activityTemp.content,
        createdAt: activityTemp.createdAt.millisecondsSinceEpoch,

        /// *  to know the directory from [_directoriesStack.lastOrNull]
        metadata: {
          "directory":
              dir == null ? null : DirectoryModel.fromEntity(dir).toJson(),
          "activity": activityTemp.toJson()
        },
      ),
    );
    _getDirectoriesAndActivities(_directoriesStack.lastOrNull);
  }
  // ----------------------------------------------------------------

  // * get directories and activities --------------------------------
  void _getDirectoriesAndActivities([DirectoryEntity? dir]) {
    final DirectoryEntity? lDir = _directoriesStack.lastOrNull;
    EasyLoading.show();
    botRepo
        .getDirActInside(
      dirId: dir?.id,
      groupId: groupCubit.group.groupId,
    )
        .listen(
      (status) async {
        EasyLoading.dismiss();
        if (status is Success<DataInDirectory>) {
          if (lDir == _directoriesStack.lastOrNull) {
            currentDirectories = status.data.directories;
            botCubit.botReply(status.data.activities);
          }
        } else {
          if (!canDirectoryPop) {
            status as Failure<DataInDirectory>;
            failureStatus(status.failure.message, () {});
          }
        }
        emit(OpenDirectoryState(currentDirectories));
      },
    );
  }
  // ----------------------------------------------------------------

  // * crud Directories
  @override
  void deleteDirectory(DirectoryEntity dir, BuildContext _) {
    deleteDirectoryDialog(
      context: _,
      dir: dir,
      deleteFn: () {
        handleStatusEmit<void>(
          statusFunction: () =>
              botRepo.deleteDirectory(botCubit.currentMember, dir),
          successFunction: (_) {
            currentDirectories.removeWhere((e) => e.id == dir.id);
            emit(DeleteDirectoryState(dir));
          },
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  @override
  void hideDirectory(DirectoryEntity dir, BuildContext _) {
    hideDirectoryDialog(
      context: _,
      dir: dir,
      hideFn: () {
        handleStatusEmit<void>(
          statusFunction: () =>
              botRepo.approveDirectory(botCubit.currentMember, dir, false),
          successFunction: (_) {
            final List<DirectoryEntity> temp = [];
            for (DirectoryEntity e in currentDirectories) {
              if (e.id == dir.id) {
                temp.add(e.copyWith(isApproved: false));
              } else {
                temp.add(e);
              }
            }
            currentDirectories = temp;
            emit(OpenDirectoryState(currentDirectories));
          },
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  @override
  void makeDirectoryApproved(DirectoryEntity dir, BuildContext _) {
    makeDirectoryApprovedDialog(
      context: _,
      dir: dir,
      approveFn: () {
        handleStatusEmit<void>(
          statusFunction: () =>
              botRepo.approveDirectory(botCubit.currentMember, dir, true),
          successFunction: (_) {
            final List<DirectoryEntity> temp = [];
            for (DirectoryEntity e in currentDirectories) {
              if (e.id == dir.id) {
                temp.add(e.copyWith(isApproved: true));
              } else {
                temp.add(e);
              }
            }
            currentDirectories = temp;
            emit(OpenDirectoryState(currentDirectories));
          },
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  @override
  void blockUserInteraction(DirectoryEntity dir, BuildContext _) {
    blockUserInteractionDialog(
      context: _,
      user: dir.createdBy.user,
      blockFn: () {
        handleStatusEmit<void>(
          statusFunction: () => botRepo.blockUserWithDir(
            dir,
            groupCubit.group.memberEntity.user.id,
          ),
          successFunction: (_) {
            currentDirectories.removeWhere((e) => e.id == dir.id);
            emit(OpenDirectoryState(currentDirectories));
          },
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  // ------------------

  String _directoryName = '';
  @override
  void addNewDirectoryOnSave(String val) => _directoryName = val.trim();

  @override
  void addNewDirectory() {
    if (directoryNameKey.currentState!.validate()) {
      directoryNameKey.currentState!.save();
      final DirectoryEntity dir = DirectoryEntity(
        id: 1,
        insideDirectoryId: _directoriesStack.lastOrNull?.id,
        name: _directoryName,
        groupId: groupCubit.group.groupId,
        isApproved: false,
        createdBy: botCubit.currentMember,
      );

      handleStatusEmit<DirectoryEntity>(
        statusFunction: () => botRepo.addNewDir(dir),
        successFunction: (newDir) {
          List<DirectoryEntity> directories = [];
          directories.addAll(currentDirectories);
          directories.add(
            newDir.copyWith(
              isApproved:
                  groupCubit.group.accessType == GroupAccessType.readWrite ||
                      groupCubit.group.memberEntity.isAdmin,
            ),
          );
          currentDirectories = directories;
          emit(OpenDirectoryState(currentDirectories));
        },
      ).then((v) => AppRoute.key.currentState?.pop());
    }
  }

  @override
  void addNewActivity([({Uint8List file, ActivityEntity activity})? file]) {
    late final ActivityEntity newActivity;
    if (file == null) {
      newActivity = ActivityEntity(
        id: -1,
        content: content,
        createdAt: DateTime.now(),
        createdBy: botCubit.currentMember,
        groupId: groupCubit.group.groupId,
        isApproved: false,
        type: MessageType.textMessage,
        insideDirectoryId: _directoriesStack.lastOrNull?.id,
        attachment: null,
        notifyOthers: NotificationEnum.withoutNotify,
      );
    } else {
      newActivity = file.activity;
    }
    final message = newActivity.toMessage();

    handleStatusEmit<ActivityEntity>(
      statusFunction: () {
        botCubit.addMessage(message.copyWith(status: types.Status.sending));
        return botRepo.addNewActivity(newActivity, file?.file);
      },
      successFunction: (addedActivity) => botCubit.updateMessage(
        addedActivity
            .copyWith(
              isApproved:
                  groupCubit.group.accessType == GroupAccessType.readWrite ||
                      groupCubit.group.memberEntity.isAdmin,
            )
            .toMessage()
            .copyWith(status: types.Status.sent, id: message.id),
      ),
      failureFunction: (f) =>
          botCubit.updateMessage(message.copyWith(status: types.Status.error)),
    ).then((v) => AppRoute.key.currentState?.pop());
  }

  @override
  void onPopInvoked(bool didPop) {
    if (_directoriesStack.isEmpty) return AppRoute.key.currentState?.pop();
    closeLastDirectory();
  }
}
