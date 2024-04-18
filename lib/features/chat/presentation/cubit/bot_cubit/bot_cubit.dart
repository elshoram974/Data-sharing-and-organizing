import 'dart:math';

import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_tapped_message.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

import '../../../data/models/activity_model.dart';
import '../../../data/models/directory_model.dart';
import '../../../domain/entities/activity_entity.dart';
import '../../../domain/entities/directory_entity.dart';
import '../../../domain/entities/member_entity.dart';
import '../../../domain/repositories/bot_repo.dart';
import '../group_cubit/group_cubit.dart';
import 'bot_fn.dart';

part 'bot_state.dart';

abstract class BOTCubit extends Cubit<BOTState> {
  BOTCubit() : super(const BotInitial());

  final GroupCubit groupCubit = ProviderDependency.group;
  late final MemberEntity currentMember = groupCubit.group.memberEntity
      .copyWith(user: ProviderDependency.userMain.user);

  late List<types.Message> botMessages = [];

  void addMessage(types.Message message);
  void handleMessageTap(BuildContext _, types.Message message);
  void handleMessageDoubleTap(BuildContext _, types.Message message);
  void handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData);
  void handleSendPressed(types.PartialText message, [types.Status? status]);

  void approvedActivity(ActivityEntity activity, BuildContext _);
  void hideActivity(ActivityEntity activity, BuildContext _);
  void deleteActivity(ActivityEntity activity, BuildContext _);

  bool canEditMessage(ActivityEntity activity);
}

class BOTCubitImp extends BOTCubit {
  final BOTRepositories botRepo;
  BOTCubitImp(this.botRepo) {
    _loadMessages();
  }

  int _i = 0;

  void _loadMessages() async {
    botMessages = botRepo.loadBotMessages(groupCubit.group.id);
    emit(SetState(_i++));
  }

  @override
  void addMessage(types.Message message) async {
    botMessages.insert(0, message);
    await botRepo.saveBotMessages(groupCubit.group, botMessages);
    emit(SetState(_i++));
  }

  @override
  bool canEditMessage(ActivityEntity activity) {
    return (ProviderDependency.group.isAdmin ||
        (activity.createdBy.user.id == ProviderDependency.userMain.user.id &&
            !activity.isApproved));
  }

  @override
  void handleMessageDoubleTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    if (message.metadata?.containsKey("directory") == true) {
      final String? json = message.metadata!["directory"] as String?;
      DirectoryEntity? dir =
          json == null ? null : DirectoryModel.fromJson(json);
      ProviderDependency.directory.goToDirectory(dir);
    } else if (message.metadata?.containsKey("activity") == true) {
      final ActivityEntity activity = ActivityModel.fromJson(message.metadata!["activity"]);
      if (canEditMessage(activity)) showActivityActions(_, activity);
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
  ) async {
    final index = botMessages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (botMessages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    botMessages[index] = updatedMessage;
    await botRepo.saveBotMessages(groupCubit.group, botMessages);
    emit(SetState(_i++));
    Future.delayed(
        const Duration(milliseconds: 50), () => emit(SetState(_i++)));
  }

  @override
  void handleSendPressed(types.PartialText message, [types.Status? status]) {
    ProviderDependency.group.closeFloatingButton();
    final ActivityModel activityTemp = ActivityModel.fromEntity(
      ActivityEntity(
        id: Random().nextInt(9999999),
        groupId: groupCubit.group.id,
        createdBy: currentMember,
        content: message.text,
        createdAt: DateTime.now(),
        isApproved: true,
        type: MessageType.textMessage,
      ),
    );
    final types.TextMessage textMessage = types.TextMessage(
      author: activityTemp.createdBy.messageAuthor(),
      createdAt: activityTemp.createdAt.millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: activityTemp.content,
      metadata: {"activity": activityTemp.toJson()},
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
        await botRepo.saveBotMessages(groupCubit.group, botMessages);

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
