import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Future<void> handleTappedMessage({
  required types.Message tappedMessage,
  required List<types.Message> messages,
  required void Function(int index, types.Message updatedMessage) updateMessage,
}) async {
  if (tappedMessage is types.FileMessage) {
    String localPath = tappedMessage.uri;

    if (tappedMessage.uri.startsWith('http')) {
      try {
        final int index =
            messages.indexWhere((element) => element.id == tappedMessage.id);
        final types.Message updatedMessage =
            (messages[index] as types.FileMessage).copyWith(
          isLoading: true,
        );

        messages[index] = updatedMessage;
        updateMessage(index, updatedMessage);

        final http.Client client = http.Client();
        final http.Response request = await client.get(Uri.parse(tappedMessage.uri));
        final Uint8List bytes = request.bodyBytes;
        final String documentsDir =
            (await getApplicationDocumentsDirectory()).path;
        localPath = '$documentsDir/${tappedMessage.name}';

        if (!File(localPath).existsSync()) {
          final File file = File(localPath);
          await file.writeAsBytes(bytes);
        }
      } finally {
        final int index =
            messages.indexWhere((element) => element.id == tappedMessage.id);
        final types.Message updatedMessage =
            (messages[index] as types.FileMessage).copyWith(
          isLoading: null,
        );

        messages[index] = updatedMessage;
        updateMessage(index, updatedMessage);
      }
    }

    await OpenFilex.open(localPath);
  }
}
