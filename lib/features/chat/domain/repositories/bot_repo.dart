import 'package:data_sharing_organizing/core/status/status.dart';

import '../entities/data_in_directory.dart';

abstract class BOTRepositories {
  const BOTRepositories();
  Future<void> saveBottomHeight(double height, int groupId);
  Stream<Status<DataInDirectory>> getDirActInside({int? dirId, required int groupId});
}
