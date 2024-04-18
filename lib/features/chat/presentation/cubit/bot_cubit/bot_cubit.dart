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
import 'bot_fn.dart';

part 'bot_state.dart';

abstract class BOTCubit extends Cubit<BOTState> {
  BOTCubit() : super(const BotInitial());

  final GroupCubit groupCubit = ProviderDependency.group;
  late final MemberEntity currentMember = groupCubit.group.memberEntity;

  late List<types.Message> botMessages = [];

  void addMessage(types.Message message);
  void handleMessageTap(BuildContext _, types.Message message);
  void handleMessageDoubleTap(BuildContext _, types.Message message);
  void handlePreviewDataFetched(types.TextMessage message, types.PreviewData previewData);
  void handleSendPressed(types.PartialText message, [types.Status? status]);

  void approvedActivity(ActivityEntity activity, BuildContext _);
  void hideActivity(ActivityEntity activity, BuildContext _);
  void deleteActivity(ActivityEntity activity, BuildContext _);
}

class BOTCubitImp extends BOTCubit {
  BOTCubitImp();

  int _i = 0;

  @override
  void addMessage(types.Message message) {
    // TODO: save this activity to last message in group
    botMessages.insert(0, message);
    emit(SetState(_i++));
  }

  @override
  void handleMessageDoubleTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    if (message.metadata?.containsKey("activity") == true) {
      final ActivityEntity activity = message.metadata!["activity"];
      showActivityActions(_, activity);
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

  // * activity edit
  // TODO: make repo for activity edit functions
  @override
  void approvedActivity(ActivityEntity activity, BuildContext _) {
    makeActivityApprovedDialog(
      context: _,
      activity: activity,
      approveFn: () {},
    );
  }

  @override
  void hideActivity(ActivityEntity activity, BuildContext _) {
    hideActivityDialog(
      context: _,
      activity: activity,
      hideFn: () {},
    );
  }

  @override
  void deleteActivity(ActivityEntity activity, BuildContext _) {
    deleteActivityDialog(
      context: _,
      activity: activity,
      deleteFn: () {},
    );
  }
}
