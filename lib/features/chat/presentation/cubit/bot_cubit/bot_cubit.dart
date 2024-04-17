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

import '../../../../../core/utils/enums/message_type/message_type.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../../domain/entities/directory_entity.dart';
import '../group_cubit/group_cubit.dart';

part 'bot_state.dart';

abstract class BOTCubit extends Cubit<BOTState> {
  BOTCubit() : super(const BotInitial());

  final GroupCubit groupCubit = ProviderDependency.group;
  late final types.User currentUser =
      groupCubit.group.memberEntity.messageAuthor();

  late List<types.Message> botMessages = [
    ActivityEntity(
      id: 455,
      groupId: 5,
      content: "Test To approve it",
      createdBy: groupCubit.group.memberEntity,
      createdAt: DateTime.now(),
      isApproved: false,
      type: MessageType.textMessage,
    ).toMessage(),
    ActivityEntity(
      id: 55,
      groupId: 5,
      content: "Test To approve it file",
      createdBy: groupCubit.group.memberEntity,
      createdAt: DateTime.now(),
      isApproved: true,
      fileSize: 0.25,
      attachmentLink:
          "https://pbs.twimg.com/profile_images/1744393322418802688/-ZF7VwbA_400x400.jpg",
      type: MessageType.other,
    ).toMessage()
  ];

  void addMessage(types.Message message);
  void handleMessageTap(BuildContext _, types.Message message);
  void handleMessageDoubleTap(BuildContext _, types.Message message);
  void handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData);
  void handleSendPressed(types.PartialText message, [types.Status? status]);
}

class BOTCubitImp extends BOTCubit {
  BOTCubitImp() {
    _loadMessages();
  }

  int _i = 0;

  void _loadMessages() async {
    // final response = await rootBundle.loadString('assets/messages.json');
    // final messages = (jsonDecode(response) as List)
    //     .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
    //     .toList();

    // setState(() {
    //   botMessages = messages;
    // });
  }

  @override
  void addMessage(types.Message message) {
    botMessages.insert(0, message);
    emit(SetState(_i++));
  }

  @override
  void handleMessageDoubleTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    print(message);
    if (message.author == currentUser) {
      if (message.metadata?.containsKey("directory") == true) {
        DirectoryEntity? dir = message.metadata!["directory"];
        print(dir); // if null this mean in home
      }
    }
  }

  @override
  void handleMessageTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    print(message);
    if (message.author == currentUser) {
      if (message.metadata?.containsKey("directory") == true) {
        DirectoryEntity? dir = message.metadata!["directory"];
        print(dir);
      }
    }
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

  @override
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

  @override
  void handleSendPressed(types.PartialText message, [types.Status? status]) {
    ProviderDependency.group.closeFloatingButton();
    final types.TextMessage textMessage = types.TextMessage(
      author: currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
      status: status,
    );

    addMessage(textMessage);

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
}
