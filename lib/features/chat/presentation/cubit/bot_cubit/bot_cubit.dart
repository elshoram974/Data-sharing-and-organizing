import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_tapped_message.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import '../../../domain/entities/activity_entity.dart';
import '../../../domain/entities/directory_entity.dart';
import '../../../domain/entities/member_entity.dart';
import '../group_cubit/group_cubit.dart';

part 'bot_state.dart';

abstract class BOTCubit extends Cubit<BOTState> {
  BOTCubit() : super(const BotInitial());

  final GroupCubit groupCubit = ProviderDependency.group;
  late final MemberEntity currentMember = groupCubit.group.memberEntity;

  late List<types.Message> botMessages = [];

  void addMessage(types.Message message);
  void addMessages(List<types.Message> messages);
  void handleMessageTap(BuildContext _, types.Message message);
  void handleMessageDoubleTap(BuildContext _, types.Message message);
  void handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData);
  void handleSendPressed(types.PartialText message, [types.Status? status]);
}

class BOTCubitImp extends BOTCubit {
  BOTCubitImp();

  int _i = 0;

  @override
  void addMessages(List<types.Message> messages) {
    botMessages.insertAll(0, messages.reversed);
    emit(SetState(_i++));
  }

  @override
  void addMessage(types.Message message) {
    botMessages.insert(0, message);
    emit(SetState(_i++));
  }

  @override
  void handleMessageDoubleTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    if (message.metadata?.containsKey("activity") == true) {
      final ActivityEntity activity = message.metadata!["activity"];
      _showAction(_, activity);
    } else if (message.metadata?.containsKey("directory") == true) {
      DirectoryEntity? dir = message.metadata!["directory"];
      ProviderDependency.directory.goToDirectory(dir);
    }
  }

  @override
  void handleMessageTap(BuildContext _, types.Message message) {
    ProviderDependency.group.closeFloatingButton();
    handleTappedMessage(
      tappedMessage: message,
      messages: botMessages,
      updateMessage: (int index, types.Message updatedMessage) {
        botMessages[index] = updatedMessage;
        emit(SetState(_i++));
      },
    );
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
    Future.delayed(
        const Duration(milliseconds: 50), () => emit(SetState(_i++)));
  }

  @override
  void handleSendPressed(types.PartialText message, [types.Status? status]) {
    ProviderDependency.group.closeFloatingButton();
    final types.TextMessage textMessage = types.TextMessage(
      author: currentMember.messageAuthor(),
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

void _showAction(
  BuildContext _,
  ActivityEntity activity,
) {
  final String content;
  final List<TextButton> actions = [
    TextButton(
      onPressed: () {},
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
          TextButton(
            onPressed: () {},
            child: Text(S.of(_).blockThisUser),
          ),
          TextButton(
            onPressed: () {},
            child: Text(S.of(_).addActivity),
          ),
        ],
      );
    } else {
      content = S.of(_).whatDoYouWantToDoWithThisActivity(activity.content);
      actions.insert(
        0,
        TextButton(
          onPressed: () {},
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
