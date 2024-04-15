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

import '../../../domain/entities/author_message_entity.dart';
import '../../../domain/entities/direction_entity.dart';
import '../../../domain/repositories/bot_repo.dart';
import '../group_cubit/group_cubit.dart';

part 'bot_state.dart';

class BOTCubit extends Cubit<BOTState> {
  final BOTRepositories botRepo;

  BOTCubit(this.botRepo) : super(const BotInitial()) {
    _loadMessages();
    _loadDirections();
  }
  int _i = 0;

  final types.User currentUser = MessageAuthor.messageAuthorFromAuth(
    ProviderDependency.userHome.userMain.user,
  );
  final GroupCubit groupCubit = ProviderDependency.group;
  final List<DirectionEntity> currentDirections = [];
  final List<DirectionEntity> _allGroupDirections = [];
  final List<DirectionEntity> _directionStack = [];

  late double bottomHeight = groupCubit.group.bottomHeight ?? 250;

  bool get isNoDirections => _allGroupDirections.isEmpty;

  void _loadMessages() async {
    // final response = await rootBundle.loadString('assets/messages.json');
    // final messages = (jsonDecode(response) as List)
    //     .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
    //     .toList();

    // setState(() {
    //   botMessages = messages;
    // });
  }
  void _loadDirections() async {
    _allGroupDirections.addAll(
      directions.where((e) => e.groupId == groupCubit.group.id),
    );
    _changeDirection();
  }

  void openDirection(DirectionEntity newDirection) {
    _directionStack.add(newDirection);
    _changeDirection();
  }

  void closeLastDirection() {
    if (_directionStack.isEmpty) return;
    _directionStack.removeLast();
    _changeDirection();
  }

  void _changeDirection() {
    currentDirections.clear();

    if (_directionStack.isEmpty) {
      currentDirections.addAll(
        _allGroupDirections.where((e) => e.insideDirectionId == 0),
      );
      emit(OpenDirectionState(DirectionEntity.newEmpty()));
    } else {
      currentDirections.addAll(
        _allGroupDirections.where(
          (e) => e.insideDirectionId == _directionStack.last.id,
        ),
      );
      emit(OpenDirectionState(_directionStack.last));
    }
  }

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
    emit(ChangeDirectionBottomHeightState(bottomHeight));
  }

  List<types.Message> botMessages = [
    types.TextMessage(
      createdAt: DateTime(2024, 4, 7, 16, 44).millisecondsSinceEpoch,
      text: 'Hi there!\ni\'m BOT',
      author: const types.User(
        firstName: "BOT",
        role: types.Role.admin,
        id: 'Bot',
      ),
      id: "aaa",
    )
  ];

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

  void handleSendPressed(types.PartialText message) {
    ProviderDependency.group.closeFloatingButton();

    final textMessage = types.TextMessage(
      author: currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void onPopInvoked(bool didPop) {
    if (_directionStack.isEmpty) return AppRoute.key.currentState?.pop();
    closeLastDirection();
  }
}
