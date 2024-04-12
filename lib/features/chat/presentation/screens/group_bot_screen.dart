import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../cubit/const_values.dart';
import '../widgets/bot_widgets/bot_custom_bubble.dart';
import '../widgets/date_header.dart';

class GroupBOTScreen extends StatefulWidget {
  const GroupBOTScreen({super.key});

  @override
  State<GroupBOTScreen> createState() => _GroupBOTScreenState();
}

class _GroupBOTScreenState extends State<GroupBOTScreen> {
  List<types.Message> _messages = [
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
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

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
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    ProviderDependency.group.closeFloatingButton();

    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Chat(
            messages: _messages,
            onBackgroundTap: ProviderDependency.group.closeFloatingButton,
            onMessageTap: _handleMessageTap,
            onPreviewDataFetched: _handlePreviewDataFetched,
            onSendPressed: _handleSendPressed,
            bubbleBuilder: customBubble,
            dateHeaderBuilder: (_) => DateHeaderWidget(_),
            inputOptions: InputOptions(
              sendButtonVisibilityMode: SendButtonVisibilityMode.always,
              onTextFieldTap: ProviderDependency.group.closeFloatingButton,
            ),
            user: _user,
            theme: botChatTheme(context),
          ),
        ),
        KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Container(
              color: AppColor.active,
              height: isKeyboardVisible ? 0 : 300,
              width: double.infinity,
            );
          },
        ),
      ],
    );
  }

  BotCustomBubble customBubble(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    return BotCustomBubble(
      isTheUser: _user.id == message.author.id,
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
