import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import '../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../../domain/entities/directory_entity.dart';
import '../../../../domain/repositories/bot_repo.dart';
import '../../group_cubit/group_cubit.dart';
import '../bot_cubit.dart';

part 'directories_state.dart';

abstract class DirectoryCubit extends Cubit<DirectoryState> {
  final BOTRepositories botRepo;
  DirectoryCubit(this.botRepo) : super(const DirectoryInitial());

  final BOTCubit botCubit = ProviderDependency.bot;
  final GroupCubit groupCubit = ProviderDependency.group;
  final List<DirectoryEntity> currentDirectories = [];

  late double bottomHeight = groupCubit.group.bottomHeight ?? 250;

  
  final List<DirectoryEntity> _allGroupDirectories = [];
  final List<DirectoryEntity> _directoriesStack = [];
  bool get isNoDirectories => _allGroupDirectories.isEmpty;

  void changeHeight(DragUpdateDetails details, BuildContext _);

  void openDirectory(DirectoryEntity newDirectory);
  void closeLastDirectory();

  void deleteDirectory(DirectoryEntity dir);
  void blockUserInteraction(AuthUserEntity createdBy);
  void addDirectory(DirectoryEntity dir);

  void botReply();
  
  void onPopInvoked(bool didPop);
}

class DirectoryCubitImp extends DirectoryCubit {
  DirectoryCubitImp(super.botRepo) {
    _loadDirectories();
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
    await botRepo.saveBottomHeight(bottomHeight, groupCubit.group.id);
    emit(ChangeDirectoryBottomHeightState(bottomHeight));
  }
  // ----------------------------------------------------------------

  void _loadDirectories() async {
    _allGroupDirectories.addAll(
      directories.where((e) => e.groupId == groupCubit.group.id),
    );
    _changeDirectory();
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
    currentDirectories.clear();
    if (_directoriesStack.isEmpty) {
      botCubit.handleSendPressed(types.PartialText(text: S.current.home));
      currentDirectories.addAll(
        _allGroupDirectories.where((e) => e.insideDirectoryId == 0),
      );
      emit(OpenDirectoryState(DirectoryEntity.newEmpty()));
    } else {
      botCubit.handleSendPressed(
          types.PartialText(text: _directoriesStack.last.name));
      currentDirectories.addAll(
        _allGroupDirectories.where(
          (e) => e.insideDirectoryId == _directoriesStack.last.id,
        ),
      );
      emit(OpenDirectoryState(_directoriesStack.last));
    }
    botReply();
  }

  // * crud Directories

  @override
  void deleteDirectory(DirectoryEntity dir) {
    // TODO: deleteDirectory code
  }

  @override
  void blockUserInteraction(AuthUserEntity createdBy) {
    // TODO: blockUserInteraction code
  }

  @override
  void addDirectory(DirectoryEntity dir) {
    // TODO: addDirectory code
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
