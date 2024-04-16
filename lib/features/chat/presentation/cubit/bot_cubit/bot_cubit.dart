import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:io';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../domain/entities/author_message_entity.dart';
import '../../../domain/entities/directory_entity.dart';
import '../../../domain/repositories/bot_repo.dart';
import '../group_cubit/group_cubit.dart';

part 'bot_state.dart';

class BOTCubit extends Cubit<BOTState> {
  final BOTRepositories botRepo;

  BOTCubit(this.botRepo) : super(const BotInitial()) {
    _loadMessages();
    _loadDirectories();
  }
  int _i = 0;

  final types.User currentUser = MessageAuthor.messageAuthorFromAuth(
    ProviderDependency.userHome.userMain.user,
  );
  final GroupCubit groupCubit = ProviderDependency.group;
  final List<DirectoryEntity> currentDirectories = [];
  final List<DirectoryEntity> _allGroupDirectories = [];
  final List<DirectoryEntity> _directoriesStack = [];

  late double bottomHeight = groupCubit.group.bottomHeight ?? 250;

  bool get isNoDirectories => _allGroupDirectories.isEmpty;

  void _loadMessages() async {
    // final response = await rootBundle.loadString('assets/messages.json');
    // final messages = (jsonDecode(response) as List)
    //     .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
    //     .toList();

    // setState(() {
    //   botMessages = messages;
    // });
  }
  void _loadDirectories() async {
    _allGroupDirectories.addAll(
      directories.where((e) => e.groupId == groupCubit.group.id),
    );
    _changeDirectory();
  }

  void openDirectory(DirectoryEntity newDirectory) {
    _directoriesStack.add(newDirectory);
    _changeDirectory();
  }

  void closeLastDirectory() {
    if (_directoriesStack.isEmpty) return;
    _directoriesStack.removeLast();
    _changeDirectory();
  }

  void _changeDirectory() {
    currentDirectories.clear();
    if (_directoriesStack.isEmpty) {
      handleSendPressed(types.PartialText(text: S.current.home));
      currentDirectories.addAll(
        _allGroupDirectories.where((e) => e.insideDirectoryId == 0),
      );
      emit(OpenDirectoryState(DirectoryEntity.newEmpty()));
    } else {
      handleSendPressed(types.PartialText(text: _directoriesStack.last.name));
      currentDirectories.addAll(
        _allGroupDirectories.where(
          (e) => e.insideDirectoryId == _directoriesStack.last.id,
        ),
      );
      emit(OpenDirectoryState(_directoriesStack.last));
    }
    _botReply();
  }

  // * crud Directories

  void deleteDirectory(DirectoryEntity dir) {
    // TODO: deleteDirectory code
  }

  void blockUserInteraction(int createdById) {
    // TODO: blockUserInteraction code
  }

  void addDirectory(DirectoryEntity dir) {
    // TODO: addDirectory code
  }

  // ------------------

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

  List<types.Message> botMessages = [];

  void _addMessage(types.Message message) {
    botMessages.insert(0, message);
    emit(SetState(_i++));
  }

  void handleMessageTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              botMessages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (botMessages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          botMessages[index] = updatedMessage;
          emit(SetState(_i++));

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              botMessages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (botMessages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          botMessages[index] = updatedMessage;
          emit(SetState(_i++));
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = botMessages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (botMessages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    botMessages[index] = updatedMessage;
    emit(SetState(_i++));
  }

  void handleSendPressed(types.PartialText message, [types.Status? status]) {
    ProviderDependency.group.closeFloatingButton();

    final types.TextMessage textMessage = types.TextMessage(
      author: currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
      status: status,
    );

    _addMessage(textMessage);

    if (textMessage.status == types.Status.sending) {
      Future.delayed(const Duration(seconds: 3), () async {
        final int index =
            botMessages.indexWhere((element) => element.id == textMessage.id);
        final types.Message updatedMessage =
            botMessages[index].copyWith(status: types.Status.seen);

        botMessages[index] = updatedMessage;
        emit(SetState(_i++));
      });
    }
  }

  void _botReply() {
    final GroupHomeEntity group = groupCubit.group;
    final String messageId = const Uuid().v4();
    final int messageCreatedAt = DateTime.now().millisecondsSinceEpoch;
    final types.User botAuthor = types.User(
      firstName: "BOT",
      role: types.Role.admin,
      id: 'Bot ${group.id}',
    );
    if (_directoriesStack.isNotEmpty) {
      return _addMessage(
        types.TextMessage(
          author: botAuthor,
          id: messageId,
          text: "${_directoriesStack.last.name} contains ...",
          createdAt: messageCreatedAt,
        ),
      );
    }
    return _addMessage(
      types.TextMessage(
        author: botAuthor,
        id: messageId,
        text: 'Hi there!\ni\'m ${group.groupName} BOT',
        createdAt: messageCreatedAt,
      ),
    );
  }

  void onPopInvoked(bool didPop) {
    if (_directoriesStack.isEmpty) return AppRoute.key.currentState?.pop();
    closeLastDirectory();
  }
}
