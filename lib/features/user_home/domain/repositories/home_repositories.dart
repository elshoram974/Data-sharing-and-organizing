import 'package:data_sharing_organizing/core/status/status.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../entities/group_home_entity.dart';

abstract class HomeRepositories {
  Future<Status<List<GroupHomeEntity>>> getGroups(({AuthUserEntity user, int page}) param);
}
