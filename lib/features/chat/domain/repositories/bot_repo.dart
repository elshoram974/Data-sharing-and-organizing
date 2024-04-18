import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../entities/data_in_directory.dart';

abstract class BOTRepositories {
  const BOTRepositories();
  Future<void> saveBottomHeight(double height, int groupId);
  List<types.Message> loadBotMessages(int groupId);
  Future<void> saveBotMessages(int groupId, List<types.Message> messages);
  Stream<Status<DataInDirectory>> getDirActInside({int? dirId, required int groupId});
}
