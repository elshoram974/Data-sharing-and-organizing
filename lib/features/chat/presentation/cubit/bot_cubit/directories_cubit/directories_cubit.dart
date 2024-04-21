import 'dart:math';

import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/failure_status_dialog_emit.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import '../../../../../auth/domain/entities/auth_user_entity.dart';
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
  void blockUserInteraction(AuthUserEntity createdBy, BuildContext _);

  void botReply(List<ActivityEntity> activities);

  void onPopInvoked(bool didPop);
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
        groupId: groupCubit.group.id,
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
          "directory": dir == null ? null : DirectoryModel.fromEntity(dir).toJson(),
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
      groupId: groupCubit.group.id,
    )
        .listen(
      (status) async {
        EasyLoading.dismiss();
        if (status is Success<DataInDirectory>) {
          if (lDir == _directoriesStack.lastOrNull) {
            currentDirectories = status.data.directories;
            botReply(status.data.activities);
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
  // TODO: make repo for directory edit functions

  @override
  void deleteDirectory(DirectoryEntity dir, BuildContext _) {
    deleteDirectoryDialog(
      context: _,
      dir: dir,
      deleteFn: () {},
    );
  }

  @override
  void hideDirectory(DirectoryEntity dir, BuildContext _) {
    hideDirectoryDialog(
      context: _,
      dir: dir,
      hideFn: () {},
    );
  }

  @override
  void makeDirectoryApproved(DirectoryEntity dir, BuildContext _) {
    makeDirectoryApprovedDialog(
      context: _,
      dir: dir,
      approveFn: () {},
    );
  }

  @override
  void blockUserInteraction(AuthUserEntity createdBy, BuildContext _) {
    blockUserInteractionDialog(
      context: _,
      user: createdBy,
      blockFn: () {},
    );
  }

  // ------------------

  @override
  void botReply(List<ActivityEntity> activities) {
    for (final ActivityEntity e in activities) {
      botCubit.addMessage(
        e.copyWith(createdAt: DateTime.now()).toMessage().copyWith(
              author: types.User(
                id: "bot ${groupCubit.group.id}",
                firstName: "BOT",
              ),
            ),
      );
    }
  }

  @override
  void onPopInvoked(bool didPop) {
    if (_directoriesStack.isEmpty) return AppRoute.key.currentState?.pop();
    closeLastDirectory();
  }
}
