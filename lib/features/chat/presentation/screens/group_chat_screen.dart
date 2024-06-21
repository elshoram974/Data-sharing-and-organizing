import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_type.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_tapped_message.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:uuid/uuid.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/entities/activity_entity.dart';
import '../../domain/entities/member_entity.dart';
import '../../domain/entities/notification_data_entity.dart';
import '../../domain/repositories/bot_repo.dart';
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
  late final FirebaseFirestore db = FirebaseFirestore.instance;
  late DocumentReference<Map<String, dynamic>> dbGroup;
  late CollectionReference<Map<String, dynamic>> dbActivities;
  late final Reference _storageRef = FirebaseStorage.instance.ref();
  late final String filesPath = "${group.groupId}/files";
  late final Reference filesRef = _storageRef.child(filesPath);
  List<types.Message> messages = [];
  final types.User _user =
      ProviderDependency.group.group.memberEntity.messageAuthor();

  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> stream;
  bool firstOpen = true;

  @override
  void initState() {
    dbGroup = db.collection('Groups').doc(group.groupId.toString());
    dbActivities = dbGroup.collection('activities');
    _loadMessages();

    stream =
        dbActivities.orderBy('createdAt', descending: true).snapshots().listen(
      (event) {
        for (var change in event.docChanges) {
          if (change.type == DocumentChangeType.added && !firstOpen) {
            final data = change.doc.data();
            if (data != null) {
              final message = types.Message.fromJson(data);
              messages.removeWhere((e) => e.id == message.id);
              setState(() {
                messages.insert(0, message.copyWith(status: types.Status.sent));
              });

              updateHomeGroup(message);
            }
          } else if (change.type == DocumentChangeType.removed) {
            final data = change.doc.data();
            if (data != null) {
              final message = types.Message.fromJson(data);
              setState(() {
                messages.removeWhere((e) => e.id == message.id);
              });
            }
          }
        }
        firstOpen = false;
      },
    );
    super.initState();
  }

  void updateHomeGroup(types.Message message) {
    late final String content;
    late final MessageType type;
    if (message is types.TextMessage) {
      content = message.text;
      type = MessageType.textMessage;
    } else if (message is types.ImageMessage) {
      content = message.name;
      type = MessageType.photo;
    } else {
      message as types.FileMessage;
      content = message.name;
      type = MessageType.document;
    }
    ProviderDependency.userHome.updateGroupLocally(
      GroupHomeEntity(
        groupId: group.groupId,
        groupName: group.groupName,
        ownerId: group.ownerId,
        discussion: group.discussion,
        memberEntity: group.memberEntity,
        createdAt: group.createdAt,
        accessType: group.accessType,
        bottomHeight: group.bottomHeight,
        imageLink: group.imageLink,
        isSelected: group.isSelected,
        screen: group.screen,
        status: group.status,
        statusMessage: group.statusMessage,
        unReadCounter: null,
        lastActivity: ActivityEntity(
          id: Random().nextInt(1000),
          groupId: group.groupId,
          createdBy: MemberEntity.fromAuthor(message.author),
          content: content,
          createdAt:
              DateTime.fromMillisecondsSinceEpoch(message.createdAt ?? 0),
          isApproved: true,
          type: type,
        ),
      ),
    );
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }

  void _addMessage(types.Message message) {
    try {
      dbActivities.doc(message.id).set(message.toJson());
    } catch (e) {
      failureStatus(e.toString(), () {});
    }
    sl.get<BOTRepositories>().sendNotification(
          NotificationDataEntity(
            title: group.groupName,
            message: notificationBody(message),
            topic: '${group.groupId}',
            type: NotificationType.message,
            body: message
                .copyWith(metadata: {'group_id': group.groupId}).toJson(),
          ),
        );
  }

  void _handleAttachmentPressed() {
    if (!(enabled || group.memberEntity.isAdmin)) return;
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
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(S.of(context).photo),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(S.of(context).file),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(S.of(context).cancel),
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

    if (result != null) {
      final String id = const Uuid().v4();
      final String nameId = '${id}_MRE_${result.files.single.name}';

      final types.FileMessage message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: id,
        mimeType: lookupMimeType(result.files.single.path ?? ''),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path ?? '',
        metadata: {'name': nameId},
      );
      setState(() {
        messages.insert(0, message.copyWith(status: types.Status.sending));
      });

      final mountainsRef = filesRef.child(nameId);
      await mountainsRef.putData(await result.files.single.xFile.readAsBytes());

      final String uri = await mountainsRef.getDownloadURL();

      _addMessage(message.copyWith(uri: uri));
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
      final String id = const Uuid().v4();
      final String nameId = '${id}_MRE_${result.name}';

      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final types.ImageMessage message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: id,
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
        metadata: {'name': nameId},
      );
      setState(() {
        messages.insert(0, message.copyWith(status: types.Status.sending));
      });

      final mountainsRef = filesRef.child(nameId);
      await mountainsRef.putData(bytes);

      final String uri = await mountainsRef.getDownloadURL();

      _addMessage(message.copyWith(uri: uri));
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
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await dbActivities.orderBy('createdAt', descending: true).get();
    final List<types.Message> loadedMessages = querySnapshot.docs
        .map((doc) => types.Message.fromJson(doc.data())
            .copyWith(status: types.Status.sent))
        .toList();

    setState(() {
      messages = [];
      messages.addAll(loadedMessages);
    });
    if (messages.isEmpty) return;
    updateHomeGroup(messages.first);
  }

  late final bool enabled = group.discussion == GroupDiscussionType.exist;

  @override
  Widget build(BuildContext context) {
    return Chat(
      onAvatarTap: (user) => ProviderDependency.group.closeFloatingButton(),
      onMessageDoubleTap: onEditMessage,
      onMessageLongPress: onEditMessage,
      onBackgroundTap: ProviderDependency.group.closeFloatingButton,
      messages: messages,
      onAttachmentPressed: _handleAttachmentPressed,
      onMessageTap: _handleMessageTap,
      onPreviewDataFetched: _handlePreviewDataFetched,
      imageMessageBuilder: (message, {required int messageWidth}) {
        return ImageMessage(
          message: message,
          messageWidth: double.maxFinite.toInt(),
        );
      },
      onSendPressed: _handleSendPressed,
      showUserAvatars: !AppConst.isWeb,
      showUserNames: true,
      bubbleBuilder: customBubble,
      l10n: ProviderDependency.config.isArabic
          ? const ChatL10nAr()
          : const ChatL10nEn(),
      dateHeaderBuilder: (_) => DateHeaderWidget(_),
      inputOptions: InputOptions(
        enabled: enabled || group.memberEntity.isAdmin,
        sendButtonVisibilityMode: enabled || group.memberEntity.isAdmin
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

  void onEditMessage(BuildContext context, types.Message message) {
    if (!group.memberEntity.isAdmin && message.author.id != _user.id) return;
    showDialog<void>(
      context: context,
      builder: (context) {
        return EditMessageDialogWidget(message, deleteMessage);
      },
    );
  }

  void deleteMessage(types.Message message) async {
    final Reference desertRef = filesRef.child(message.metadata?['name'] ?? '');

    Stream.fromFutures([
      dbActivities.doc(message.id).delete(),
      desertRef.delete(),
    ]);
  }
}

class EditMessageDialogWidget extends StatelessWidget {
  const EditMessageDialogWidget(
    this.message,
    this.deleteMessage, {
    super.key,
  });
  final types.Message message;
  final void Function(types.Message) deleteMessage;
  @override
  Widget build(BuildContext context) {
    String? content;
    if (message is types.TextMessage) {
      content = (message as types.TextMessage).text;
    }
    return AlertDialog(
      content: Text(S.of(context).whatActionWithContent(content ?? '')),
      actions: [
        TextButton(
          onPressed: () {
            deleteMessage(message);
            context.pop();
          },
          child: Text(S.of(context).delete),
        ),
        TextButton(
          onPressed: () => context.pop(),
          child: Text(S.of(context).cancel),
        ),
      ],
    );
  }
}

String notificationBody(types.Message message) {
  switch (message.type) {
    case types.MessageType.text:
      message as types.TextMessage;
      return "${message.author.firstName} ${message.author.lastName}: ${message.text}";
    case types.MessageType.image:
      message as types.ImageMessage;
      return "${message.author.firstName} ${message.author.lastName}: 🖼️${message.name}";
    case types.MessageType.file:
      message as types.FileMessage;
      return "${message.author.firstName} ${message.author.lastName}: 📄${message.name}";
    default:
      return "message from ${message.author.firstName} ${message.author.lastName}";
  }
}
