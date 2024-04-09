import 'package:bubble/bubble.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/convert_date_to_string.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_ui/src/models/date_header.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_app_bar.dart';

class UserGroupScreen extends StatelessWidget {
  const UserGroupScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return ChatPage(group: group);
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.group});
  final GroupHomeEntity group;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
    final result = await FilePicker.platform.pickFiles(
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

  Directionality customBubble(
    Widget child, {
    required types.Message message,
    required bool nextMessageInGroup,
  }) {
    final bool isTheUser = _user.id == message.author.id;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment:
            isTheUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 2),
            child: Text(
              "${message.author.firstName ?? ''} ${message.author.lastName ?? ''}",
              style: AppStyle.styleBoldInika16.copyWith(fontSize: 10),
            ),
          ),
          Bubble(
            padding: const BubbleEdges.all(0),
            radius: const Radius.circular(5),
            color:
                isTheUser ? AppColor.primary : AppColor.grayLightDark(context),
            margin: !nextMessageInGroup
                ? const BubbleEdges.symmetric(horizontal: 6)
                : null,
            nip: isTheUser ? BubbleNip.rightTop : BubbleNip.leftTop,
            child: child,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 2,
            ),
            child: Text(
              intl.DateFormat.jm().format(
                DateTime.fromMillisecondsSinceEpoch(message.createdAt ?? 0),
              ),
              style: const TextStyle(fontSize: 8, color: AppColor.gray),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GroupAppBar(group: widget.group),
      body: Chat(
        onAvatarTap: (p0) {},
        onMessageLongPress: (context, p1) {},
        messages: _messages,
        onAttachmentPressed: _handleAttachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        showUserAvatars: true,
        showUserNames: true,
        bubbleBuilder: customBubble,
        dateHeaderBuilder: (_) => dateHeader(context, _),
        user: _user,
        nameBuilder: (u) => const SizedBox.shrink(),
        theme: DefaultChatTheme(
          inputMargin: const EdgeInsets.only(
            left: AppConst.defaultPadding,
            right: AppConst.defaultPadding,
            bottom: 0.5 * AppConst.defaultPadding,
          ),
          primaryColor: AppColor.primary,
          backgroundColor: AppColor.background(context),
          inputBorderRadius: BorderRadius.circular(15),
          secondaryColor: AppColor.grayLightDark(context),
          messageBorderRadius: 5,
          messageInsetsVertical: 8,
          messageInsetsHorizontal: 8,
          sentMessageBodyTextStyle: AppStyle.styleBoldInika13,
          receivedMessageBodyTextStyle: AppStyle.styleBoldInika13,
          inputTextStyle: AppStyle.styleBoldInika13,
          inputElevation: 1,
          inputPadding: EdgeInsets.zero,
          inputBackgroundColor: AppColor.grayLightDark(context),
          attachmentButtonIcon: const MyAttachmentButtonIcon(),
        ),
      ),
    );
  }

  Bubble dateHeader(BuildContext context, DateHeader dateHeader) {
    return Bubble(
      margin: const BubbleEdges.only(
        top: AppConst.defaultPadding,
        bottom: 0.5 * AppConst.defaultPadding,
      ),
      alignment: Alignment.center,
      nip: BubbleNip.no,
      color: AppColor.grayLightDark(context),
      child: Text(
        DateToString.call(dateHeader.dateTime, true),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 11.0,
          color: Colors.black38,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MyAttachmentButtonIcon extends StatelessWidget {
  const MyAttachmentButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 45,
      child: const Icon(
        Icons.attach_file_outlined,
        color: Colors.white,
      ),
    );
  }
}
