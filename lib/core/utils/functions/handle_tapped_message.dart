import 'dart:io';
import 'dart:typed_data';

// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
// import 'dart:html' as html;

import 'package:path_provider/path_provider.dart';

// import '../constants/app_constants.dart';

Future<void> handleTappedMessage({
  required types.Message tappedMessage,
  required List<types.Message> messages,
  required void Function(int index, types.Message updatedMessage) updateMessage,
}) async {
  if (tappedMessage is types.FileMessage) {
    String localPath = tappedMessage.uri;
    final String documentsDir = (await getApplicationDocumentsDirectory()).path;

    if (tappedMessage.uri.startsWith('http')) {
      localPath = '$documentsDir/${tappedMessage.name}';
      if (!File(localPath).existsSync()) {
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
          final http.Response request =
              await client.get(Uri.parse(tappedMessage.uri));
          final Uint8List bytes = request.bodyBytes;

          localPath = '$documentsDir/${tappedMessage.name}';

          final File file = File(localPath);
          await file.writeAsBytes(bytes);
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
    }

    await OpenFilex.open(localPath);
  }
}

// Future<void> _saveFile(String fileName, Uint8List fileBytes) async {
//   if (AppConst.isWeb) {
//     // Web: Use AnchorElement to download the file
//     final html.Blob blob = html.Blob([fileBytes]);
//     final String url = html.Url.createObjectUrlFromBlob(blob);
//     html.AnchorElement(href: url)
//       ..setAttribute("download", fileName)
//       ..click();
//     html.Url.revokeObjectUrl(url);
//   } else {
//     // Android: Save to cache directory using flutter_cache_manager
//     final DefaultCacheManager cacheManager = DefaultCacheManager();
//     final File file = await cacheManager.putFile(fileName, fileBytes);
//   }
// }
