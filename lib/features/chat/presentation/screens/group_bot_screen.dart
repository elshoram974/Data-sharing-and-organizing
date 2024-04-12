import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flex_list/flex_list.dart';

import '../../domain/entities/direction_entity.dart';
import '../cubit/bot_cubit/bot_cubit.dart';
import '../cubit/const_values.dart';
import '../widgets/bot_widgets/bot_custom_bubble.dart';
import '../widgets/date_header.dart';

class GroupBOTScreen extends StatelessWidget {
  const GroupBOTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.bot = BlocProvider.of<BOTCubit>(context, listen: true);
    BOTCubit c = ProviderDependency.bot;
    return Column(
      children: [
        Expanded(
          child: Chat(
            messages: c.botMessages,
            onBackgroundTap: ProviderDependency.group.closeFloatingButton,
            onMessageTap: c.handleMessageTap,
            onPreviewDataFetched: c.handlePreviewDataFetched,
            onSendPressed: c.handleSendPressed,
            bubbleBuilder: customBubble,
            dateHeaderBuilder: (_) => DateHeaderWidget(_),
            inputOptions: InputOptions(
              sendButtonVisibilityMode: SendButtonVisibilityMode.always,
              onTextFieldTap: ProviderDependency.group.closeFloatingButton,
            ),
            user: c.currentUser,
            theme: botChatTheme(context),
          ),
        ),
        const DirectionsWidget(),
      ],
    );
  }

  BotCustomBubble customBubble(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    return BotCustomBubble(
      isTheUser: ProviderDependency.bot.currentUser.id == message.author.id,
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
      inputPadding: EdgeInsets.zero,
      inputBackgroundColor: AppColor.grayLightDark(context),
    );
  }
}

class DirectionsWidget extends StatelessWidget {
  const DirectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BOTCubit c = ProviderDependency.bot;
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Container(
          height: isKeyboardVisible ? 0 : 250,
          width: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
            child: BlocBuilder<BOTCubit, BOTState>(
              buildWhen: (p, c) => c is OpenDirectionState,
              builder: (context, state) {
                return FlexList(
                  horizontalSpacing: 0.5 * AppConst.defaultPadding,
                  verticalSpacing: 20,
                  children: [
                    ...List.generate(
                      c.currentDirections.length,
                      (i) {
                        final DirectionEntity direction =
                            c.currentDirections[i];
                        return SizedBox(
                          height: 38,
                          child: MyFilledButton(
                            onPressed: () => c.openDirection(direction),
                            text: direction.name,
                            style:
                                AppStyle.styleBoldInika16.copyWith(height: 0.8),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 38,
                      width: double.infinity,
                      child: MyFilledButton(
                        onPressed: c.closeDirection,
                        filledColor: AppColor.active,
                        text: S.of(context).back,
                        style: AppStyle.styleBoldInika16,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
