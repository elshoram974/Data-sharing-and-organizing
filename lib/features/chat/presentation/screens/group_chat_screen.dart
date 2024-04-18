import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_tapped_message.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

import '../cubit/const_values.dart';
import '../widgets/chat_widgets/chat_custom_bubble.dart';
import '../widgets/my_attachment_button.dart';
import '../widgets/date_header.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  List<types.Message> _messages = [
    types.TextMessage(
      createdAt: DateTime(2024, 4, 7, 16, 44).millisecondsSinceEpoch,
      text: 'Hi there!\ni\'m Mohammed El Shora',
      author: const types.User(
        firstName: "Mohammed",
        lastName: "El Shora",
        role: types.Role.admin,
        id: 'Mohammed El Shora',
      ),
      // duration: Duration(seconds: 5),
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

  void _handleAttachmentPressed() {
    if (!enabled) return;
    ProviderDependency.group.closeFloatingButton();

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    ProviderDependency.group.closeFloatingButton();
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    ProviderDependency.group.closeFloatingButton();
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    ProviderDependency.group.closeFloatingButton();
    handleTappedMessage(
      tappedMessage: message,
      messages: _messages,
      updateMessage: (int index, types.Message updatedMessage) {
        setState(() {
          _messages[index] = updatedMessage;
        });
      },
    );
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

  final bool enabled =
      ProviderDependency.group.group.discussion == GroupDiscussionType.exist;

  @override
  Widget build(BuildContext context) {
    return Chat(
      onAvatarTap: (user) {
        ProviderDependency.group.closeFloatingButton();
      },
      onMessageLongPress: (context, message) {},
      onBackgroundTap: ProviderDependency.group.closeFloatingButton,
      messages: _messages,
      onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      onSendPressed: _handleSendPressed,
      showUserAvatars: true,
      showUserNames: true,
      bubbleBuilder: customBubble,
      dateHeaderBuilder: (_) => DateHeaderWidget(_),
      inputOptions: InputOptions(
        enabled: enabled,
        sendButtonVisibilityMode: enabled
            ? SendButtonVisibilityMode.hidden
            : SendButtonVisibilityMode.editing,
        onTextFieldTap: ProviderDependency.group.closeFloatingButton,
      ),
      user: _user,
      theme: _chatTheme(context),
    );
  }

  ChatCustomBubble customBubble(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    return ChatCustomBubble(
      isTheUser: _user.id == message.author.id,
      message: message,
      nextMessageInGroup: nextMessageInGroup,
      child: child,
    );
  }

  DefaultChatTheme _chatTheme(BuildContext context) {
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
      attachmentButtonIcon: const MyAttachmentButtonIcon(),
    );
  }
}
