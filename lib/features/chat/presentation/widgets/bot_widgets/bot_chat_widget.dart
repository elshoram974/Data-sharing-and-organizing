import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_image_in_chat.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import '../../cubit/bot_cubit/bot_cubit.dart';
import '../../cubit/const_values.dart';
import '../date_header.dart';
import 'bot_custom_bubble.dart';

class BotChatWidget extends StatelessWidget {
  const BotChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BOTCubit c = BlocProvider.of<BOTCubit>(context, listen: true);
    return Expanded(
      child: Chat(
        messages: c.botMessages,
        onBackgroundTap: ProviderDependency.group.closeFloatingButton,
        onMessageTap: c.handleMessageTap,
        imageProviderBuilder: imageProviderBuilder,
        onMessageLongPress: c.handleMessageDoubleTap,
        onMessageDoubleTap: c.handleMessageDoubleTap,
        onPreviewDataFetched: c.handlePreviewDataFetched,
        onSendPressed: (m) => c.handleSendPressed(m, types.Status.sending),
        bubbleBuilder: customBubble,
        scrollToUnreadOptions: ScrollToUnreadOptions(
          lastReadMessageId: c.botMessages.firstOrNull?.id,
        ),
        dateHeaderBuilder: (_) => DateHeaderWidget(_),
        l10n: ProviderDependency.config.isArabic
            ? const ChatL10nAr(inputPlaceholder: "تحدث مع الذكاء الاصطناعي")
            : const ChatL10nEn(inputPlaceholder: "Ask AI..."),
        inputOptions: InputOptions(
          sendButtonVisibilityMode: SendButtonVisibilityMode.always,
          onTextFieldTap: ProviderDependency.group.closeFloatingButton,
        ),
        typingIndicatorOptions: TypingIndicatorOptions(
          typingUsers: c.typingUsers,
        ),
        user: c.currentMember.messageAuthor(),
        theme: botChatTheme(context),
      ),
    );
  }

  BotCustomBubble customBubble(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    final BOTCubit c = ProviderDependency.bot;
    return BotCustomBubble(
      isTheUser: c.currentMember.messageAuthor().id == message.author.id,
      message: message,
      nextMessageInGroup: nextMessageInGroup,
      child: child,
    );
  }

  DefaultChatTheme botChatTheme(BuildContext context) {
    return DefaultChatTheme(
      inputMargin: const EdgeInsets.only(
        left: AppConst.defaultPadding,
        right: AppConst.defaultPadding,
        bottom: 0.5 * AppConst.defaultPadding,
      ),
      primaryColor: AppColor.primary,
      backgroundColor: AppColor.background(context),
      inputBorderRadius: BorderRadius.circular(15),
      secondaryColor: AppColor.grayLightDark(context),
      messageBorderRadius: 0.5 * AppConst.borderRadius,
      messageInsetsVertical: 8,
      messageInsetsHorizontal: 8,
      receivedMessageBodyLinkTextStyle: link,
      receivedMessageLinkTitleTextStyle: linkTitle,
      receivedMessageLinkDescriptionTextStyle: linkDescription,
      sentMessageBodyLinkTextStyle: link,
      sentMessageLinkTitleTextStyle: linkTitle,
      sentMessageLinkDescriptionTextStyle: linkDescription,
      sentMessageBodyTextStyle: AppStyle.styleBoldInika13,
      receivedMessageBodyTextStyle: AppStyle.styleBoldInika13,
      inputTextStyle: AppStyle.styleBoldInika13,
      inputElevation: 1,
      typingIndicatorTheme: typingIndicatorTheme(context),
      inputPadding: AppConst.isWeb
          ? const EdgeInsets.symmetric(vertical: 10)
          : EdgeInsets.zero,
      inputBackgroundColor: AppColor.grayLightDark(context),
    );
  }

  TypingIndicatorTheme typingIndicatorTheme(BuildContext context) {
    return TypingIndicatorTheme(
      animatedCirclesColor: neutral1,
      animatedCircleSize: 5.0,
      bubbleBorder: const BorderRadius.all(Radius.circular(27.0)),
      bubbleColor: AppColor.background(context),
      countAvatarColor: primary,
      countTextColor: secondary,
      multipleUserTextStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: neutral2,
      ),
    );
  }
}
