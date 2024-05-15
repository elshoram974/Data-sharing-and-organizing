import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_tapped_message.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
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
  final GroupHomeEntity group = ProviderDependency.group.group;
  late FirebaseFirestore db;
  late DocumentReference<Map<String, dynamic>> dbGroup;
  late CollectionReference<Map<String, dynamic>> dbActivities;
  List<types.Message> messages = [];
  final types.User _user =
      ProviderDependency.group.group.memberEntity.messageAuthor();

  @override
  void initState() {
    super.initState();
    db = FirebaseFirestore.instance;
    dbGroup = db.collection('Groups').doc(group.id.toString());
    dbActivities = dbGroup.collection('activities');
    _loadMessages();

    dbActivities
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      for (var change in event.docChanges) {
        if (change.type == DocumentChangeType.added) {
          final data = change.doc.data();
          if (data != null) {
            final message = types.Message.fromJson(data);
            setState(() {
              messages.insert(0, message);
            });
          }
        }
      }
    });
  }

  void _addMessage(types.Message message) async {
    try {
      await dbActivities.add(message.toJson());
    } catch (e) {
      print(e);
    }
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
      messages: messages,
      updateMessage: (int index, types.Message updatedMessage) {
        setState(() {
          messages[index] = updatedMessage;
        });
      },
    );
  }

  void _handlePreviewDataFetched(
      types.TextMessage message, types.PreviewData previewData) {
    final index = messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      messages[index] = updatedMessage;
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
    final querySnapshot = await dbActivities.orderBy('createdAt', descending: true).get();
    final loadedMessages = querySnapshot.docs
        .map((doc) => types.Message.fromJson(doc.data()))
        .toList();

    setState(() {
      messages = loadedMessages;
    });
  }

  late final bool enabled = group.discussion == GroupDiscussionType.exist;

  @override
  Widget build(BuildContext context) {
    return Chat(
      onAvatarTap: (user) {
        ProviderDependency.group.closeFloatingButton();
      },
      onMessageLongPress: (context, message) {},
      onBackgroundTap: ProviderDependency.group.closeFloatingButton,
      messages: messages,
      onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      onSendPressed: _handleSendPressed,
      showUserAvatars: true,
      showUserNames: true,
      bubbleBuilder: customBubble,
      l10n: ProviderDependency.config.isArabic
          ? const ChatL10nAr()
          : const ChatL10nEn(),
      dateHeaderBuilder: (_) => DateHeaderWidget(_),
      inputOptions: InputOptions(
        enabled: enabled,
        sendButtonVisibilityMode: enabled
            ? SendButtonVisibilityMode.editing
            : SendButtonVisibilityMode.hidden,
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
      attachmentButtonIcon: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: MyAttachmentButtonIcon(),
      ),
    );
  }
}
