import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import '../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../../domain/entities/directory_entity.dart';
import '../../../../domain/repositories/directories_repo.dart';
import '../../group_cubit/group_cubit.dart';
import '../bot_cubit.dart';

part 'directories_state.dart';

abstract class DirectoryCubit extends Cubit<DirectoryState> {
  final DirectoriesRepositories dirRepo;
  DirectoryCubit(this.dirRepo) : super(const DirectoryInitial());

  final BOTCubit botCubit = ProviderDependency.bot;
  final GroupCubit groupCubit = ProviderDependency.group;

  final List<DirectoryEntity> _directoriesStack = [];
  List<DirectoryEntity> currentDirectories = [];

  late double bottomHeight = groupCubit.group.bottomHeight ?? 250;

  bool get canDirectoryPop => _directoriesStack.isNotEmpty;

  void changeHeight(DragUpdateDetails details, BuildContext _);

  void openDirectory(DirectoryEntity newDirectory);
  void closeLastDirectory();

  void deleteDirectory(DirectoryEntity dir);
  void hideDirectory(DirectoryEntity dir);
  void addDirectory(DirectoryEntity dir);
  void blockUserInteraction(AuthUserEntity createdBy);

  void botReply();

  void onPopInvoked(bool didPop);
}

class DirectoryCubitImp extends DirectoryCubit {
  DirectoryCubitImp(super.dirRepo) {
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
    await dirRepo.saveBottomHeight(bottomHeight, groupCubit.group.id);
    emit(ChangeDirectoryBottomHeightState(bottomHeight));
  }
  // ----------------------------------------------------------------

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
    botCubit.addMessage(
      types.TextMessage(
          id: const Uuid().v4(),
          author: botCubit.currentUser,
          text: _directoriesStack.lastOrNull?.name ?? S.current.home,
          metadata: {"directory": _directoriesStack.lastOrNull}),
    );
    _getDirectories(_directoriesStack.lastOrNull);
  }

  void _getDirectories([DirectoryEntity? dir]) {
    final DirectoryEntity? lDir = _directoriesStack.lastOrNull;
    EasyLoading.show();
    dirRepo
        .getDirectoriesInside(
      dirId: dir?.id,
      groupId: groupCubit.group.id,
    )
        .listen(
      (event) async {
        EasyLoading.dismiss();
        final Status<List<DirectoryEntity>> status = event;
        if (status is Success<List<DirectoryEntity>>) {
          if (lDir == _directoriesStack.lastOrNull) {
            currentDirectories = status.data;
            botReply();
            // TODO: get activities
          }
        } else {
          if (!canDirectoryPop) {
            status as Failure<List<DirectoryEntity>>;
            failureStatus(status.failure.message, () {});
          }
        }
        emit(OpenDirectoryState(currentDirectories));
      },
    );
  }

  // * crud Directories

  @override
  void deleteDirectory(DirectoryEntity dir) {
    // TODO: deleteDirectory code
  }

  @override
  void hideDirectory(DirectoryEntity dir) {
    // TODO: hideDirectory code
  }

  @override
  void addDirectory(DirectoryEntity dir) {
    // TODO: addDirectory code
  }
  @override
  void blockUserInteraction(AuthUserEntity createdBy) {
    // TODO: blockUserInteraction code
  }

  // ------------------

  @override
  void botReply() {
    final GroupHomeEntity group = groupCubit.group;
    final String messageId = const Uuid().v4();
    final int messageCreatedAt = DateTime.now().millisecondsSinceEpoch;
    final types.User botAuthor = types.User(
      firstName: "BOT",
      role: types.Role.admin,
      id: 'Bot ${group.id}',
    );
    if (_directoriesStack.isNotEmpty) {
      return botCubit.addMessage(
        types.TextMessage(
          author: botAuthor,
          id: messageId,
          text: "${_directoriesStack.last.name} contains ...",
          createdAt: messageCreatedAt,
        ),
      );
    }
    return botCubit.addMessage(
      types.TextMessage(
        author: botAuthor,
        id: messageId,
        text: 'Hi there!\ni\'m ${group.groupName} BOT',
        createdAt: messageCreatedAt,
      ),
    );
  }

  @override
  void onPopInvoked(bool didPop) {
    if (_directoriesStack.isEmpty) return AppRoute.key.currentState?.pop();
    closeLastDirectory();
  }
}

void failureStatus(String error, void Function() emit) {
  emit();
  EasyLoading.showError(error, duration: const Duration(seconds: 5));
}
