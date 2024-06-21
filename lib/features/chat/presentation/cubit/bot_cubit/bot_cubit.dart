import 'dart:math';

import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
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
  late final types.User botAuthor = types.User(
    id: "bot ${groupCubit.group.groupId}",
    firstName: "BOT",
    imageUrl: groupCubit.group.imageLink,
  );

  late List<types.Message> botMessages = [];

  void addMessage(types.Message message);
  void addMessages(List<types.Message> messages);
  void botReply(List<ActivityEntity> activities);
  void handleMessageTap(BuildContext _, types.Message message);
  void handleMessageDoubleTap(BuildContext _, types.Message message);
  void updateMessage(types.Message message);
  void handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData);
  void handleSendPressed(types.PartialText message, [types.Status? status]);

  void approvedActivity(types.Message message, BuildContext _);
  void hideActivity(types.Message message, BuildContext _);
  void deleteActivity(types.Message message, BuildContext _);

  bool canEditMessage(ActivityEntity activity);

  void blockUserInteraction(types.Message message, BuildContext _);
}

class BOTCubitImp extends BOTCubit {
  final BOTRepositories botRepo;
  BOTCubitImp(this.botRepo) {
    _loadMessages();
  }

  int _i = 0;

  void _loadMessages() async {
    botMessages = botRepo.loadBotMessages(groupCubit.group.groupId);
    emit(SetState(_i++));
  }

  @override
  void addMessage(types.Message message) async {
    botMessages.insert(0, message);
    await botRepo.saveBotMessages(groupCubit.group, botMessages);
    emit(SetState(_i++));
  }

  @override
  void addMessages(List<types.Message> messages) async {
    botMessages.insertAll(0, messages.reversed);
    await botRepo.saveBotMessages(groupCubit.group, botMessages);
    emit(SetState(_i++));
  }

  @override
  void botReply(List<ActivityEntity> activities) {
    final List<types.Message> temp = [];
    int? index;
    ActivityEntity? toDelete;
    for (int i = 0; i < botMessages.length; i++) {
      index = i;
      if (botMessages[i].author.firstName?.trim() != "BOT") break;
      toDelete = ActivityModel.fromJson(botMessages[i].metadata?['activity']);
    }

    if (activities.firstOrNull?.insideDirectoryId ==
            toDelete?.insideDirectoryId &&
        botMessages.isNotEmpty &&
        activities.isNotEmpty &&
        index != null) {
      botMessages.removeRange(0, index);
    }

    for (final ActivityEntity e in activities) {
      temp.add(
        e.copyWith(createdAt: DateTime.now()).toMessage().copyWith(
              author: botAuthor,
            ),
      );
    }
    addMessages(temp);
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
      final ActivityEntity activity =
          ActivityModel.fromJson(message.metadata!["activity"]);
      if (canEditMessage(activity) &&
          "BOT" == message.author.firstName?.trim()) {
        showActivityActions(_, activity, message);
      }
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
  void updateMessage(types.Message message) async {
    final index = botMessages.indexWhere((element) => element.id == message.id);

    botMessages[index] = message;
    await botRepo.saveBotMessages(groupCubit.group, botMessages);
    emit(SetState(_i++));
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
  void handleSendPressed(types.PartialText message,
      [types.Status? status]) async {
    ProviderDependency.group.closeFloatingButton();
    final ActivityModel activityTemp = ActivityModel.fromEntity(
      ActivityEntity(
        id: Random().nextInt(9999999),
        groupId: groupCubit.group.groupId,
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
    await botRepo.saveBotMessages(groupCubit.group, botMessages);
    emit(SetState(_i++));

    final int i =
        botMessages.indexWhere((element) => element.id == textMessage.id);

    bool inFirstReply = true;

    botRepo.askAI(activityTemp, MemberEntity.fromAuthor(botAuthor)).listen(
      (status) async {
        if (status is Success<List<ActivityEntity>>) {
          if (inFirstReply) {
            final types.Message updatedMessage = botMessages[i].copyWith(
              status: types.Status.seen,
            );
            botMessages[i] = updatedMessage;
            inFirstReply = false;
          }

          final List<types.Message> temp = [];
          for (final ActivityEntity e in status.data) {
            temp.add(
              e.copyWith(createdAt: DateTime.now()).toMessage().copyWith(
                    author: botAuthor,
                  ),
            );
          }
          addMessages(temp);
        } else {
          status as Failure<List<ActivityEntity>>;

          failureStatus(status.failure.message, () {
            final types.Message updatedMessage = botMessages[i].copyWith(
              status: types.Status.error,
            );
            botMessages[i] = updatedMessage;
          });
        }
        await botRepo.saveBotMessages(groupCubit.group, botMessages);
        emit(SetState(_i++));
      },
      onDone: () {},
    );
  }

  // * activity edit
  @override
  void approvedActivity(types.Message message, BuildContext _) {
    final ActivityEntity activity =
        ActivityModel.fromJson(message.metadata!["activity"]);

    makeActivityApprovedDialog(
      context: _,
      activity: activity,
      approveFn: () {
        handleStatusEmit<void>(
          statusFunction: () =>
              botRepo.approveActivity(currentMember, activity, true),
          successFunction: (_) {
            final Map<String, dynamic> myMetaData = {};
            myMetaData.addAll(message.metadata ?? {});
            myMetaData['activity'] =
                ActivityModel.fromEntity(activity.copyWith(isApproved: true))
                    .toJson();
            final int i = botMessages.indexWhere((e) => e.id == message.id);
            botMessages[i] = botMessages[i].copyWith(metadata: myMetaData);
            emit(SetState(_i++));
          },
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  @override
  void hideActivity(types.Message message, BuildContext _) {
    final ActivityEntity activity =
        ActivityModel.fromJson(message.metadata!["activity"]);
    hideActivityDialog(
      context: _,
      activity: activity,
      hideFn: () {
        handleStatusEmit<void>(
          statusFunction: () =>
              botRepo.approveActivity(currentMember, activity, false),
          successFunction: (_) {
            final Map<String, dynamic> myMetaData = {};
            myMetaData.addAll(message.metadata ?? {});
            myMetaData['activity'] =
                ActivityModel.fromEntity(activity.copyWith(isApproved: false))
                    .toJson();
            final int i = botMessages.indexWhere((e) => e.id == message.id);
            botMessages[i] = botMessages[i].copyWith(metadata: myMetaData);
            emit(SetState(_i++));
          },
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  @override
  void deleteActivity(types.Message message, BuildContext _) {
    final ActivityEntity activity =
        ActivityModel.fromJson(message.metadata!["activity"]);
    deleteActivityDialog(
      context: _,
      activity: activity,
      deleteFn: () {
        handleStatusEmit<void>(
          statusFunction: () => botRepo.deleteActivity(currentMember, activity),
          successFunction: (_) => removeMessage(message),
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  @override
  void blockUserInteraction(types.Message message, BuildContext _) {
    final ActivityEntity activity =
        ActivityModel.fromJson(message.metadata!["activity"]);
    blockUserInteractionDialog(
      context: _,
      user: activity.createdBy.user,
      blockFn: () {
        handleStatusEmit<void>(
          statusFunction: () => botRepo.blockUserWithActivity(
            activity,
            groupCubit.group.memberEntity.user.id,
          ),
          successFunction: (_) => removeMessage(message),
        ).then((v) => Navigator.of(_).pop());
      },
    );
  }

  void removeMessage(types.Message message) {
    botMessages.removeWhere((e) => e.id == message.id);
    emit(SetState(_i++));
  }
}
