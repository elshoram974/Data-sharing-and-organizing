import 'package:data_sharing_organizing/core/utils/functions/convert_date_to_string.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_tapped_message.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;

class DocsWidget extends StatefulWidget {
  const DocsWidget(this.files, {super.key});
  final List<FileMessage> files;

  @override
  State<DocsWidget> createState() => _DocsWidgetState();
}

class _DocsWidgetState extends State<DocsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.files.length,
      itemBuilder: (context, i) {
        final message = widget.files[i];
        final String? ex = message.mimeType?.split('/').last.toUpperCase();
        final String? type = message.mimeType?.split('/').first.toLowerCase();

        return ListTile(
          onTap: () {
            setState(() {
              widget.files[i] =
                  widget.files[i].copyWith(isLoading: true) as FileMessage;
            });
            handleTappedMessage(
              tappedMessage: message,
              messages: widget.files,
              updateMessage: (index, updatedMessage) {
                setState(() {
                  widget.files[index] = updatedMessage as FileMessage;
                });
              },
            );
          },
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          leading: message.isLoading == true
              ? const CircularProgressIndicator()
              : Icon(getIcon(type)),
          trailing: Text(
            DateToString.call(
              DateTime.fromMillisecondsSinceEpoch(message.createdAt!),
              false,
            ),
            style: AppStyle.styleRegular15.copyWith(fontSize: 10),
          ),
          title: Text(
            message.name,
            style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
          ),
          subtitle: Text(
            "${ui.formatBytes(message.size.truncate())} . $ex",
            style: AppStyle.styleBoldInika16.copyWith(fontSize: 8),
          ),
        );
      },
    );
  }

  IconData getIcon(String? type) {
    switch (type) {
      case 'image':
        return Icons.photo_outlined;

      case 'video':
        return Icons.smart_display_outlined;

      case 'audio':
        return Icons.audiotrack_outlined;

      default:
        return Icons.insert_drive_file_outlined;
    }
  }
}
