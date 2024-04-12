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

part 'bot_state.dart';

class BOTCubit extends Cubit<BotState> {
  BOTCubit() : super(const BotInitial()) {
    _loadMessages();
  }
  final types.User currentUser = MessageAuthor.messageAuthorFromAuth(ProviderDependency.userHome.userMain.user);
  void _loadMessages() async {
    // final response = await rootBundle.loadString('assets/messages.json');
    // final messages = (jsonDecode(response) as List)
    //     .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
    //     .toList();

    // setState(() {
    //   botMessages = messages;
    // });
  }

  int i = 0;

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
    print(botMessages[0].id);
    emit(SetState(i++));
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
          emit(SetState(i++));

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
          emit(SetState(i++));
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
    emit(SetState(i++));
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
}
