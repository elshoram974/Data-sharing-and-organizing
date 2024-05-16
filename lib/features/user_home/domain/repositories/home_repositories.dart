import 'package:data_sharing_organizing/core/status/status.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../entities/group_home_entity.dart';

abstract class HomeRepositories {
  Stream<Status<List<GroupHomeEntity>>> getGroups(AuthUserEntity user);
  Stream<Status<List<GroupHomeEntity>>> getMyGroups(AuthUserEntity user);
  Future<Status<bool>> exitFromSomeGroups(({AuthUserEntity user, List<GroupHomeEntity> removedGroups}) param);
  Future<Status<Iterable<int>>> markAsUnRead(List<GroupHomeEntity> groups);

  Future<void> updateGroupLocally(GroupHomeEntity groupUpdated);

  Future<Status<void>> editNotification(GroupHomeEntity group);
}
