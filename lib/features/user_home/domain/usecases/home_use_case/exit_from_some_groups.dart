import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../entities/group_home_entity.dart';
import '../../repositories/home_repositories.dart';

final class ExitFromSomeGroups extends UseCase<bool,
    ({List<GroupHomeEntity> removedGroups, AuthUserEntity user})> {
  final HomeRepositories homeRepositories;

  const ExitFromSomeGroups(this.homeRepositories);

  @override
  Future<Status<bool>> call(
      ({List<GroupHomeEntity> removedGroups, AuthUserEntity user}) param) {
    return homeRepositories.exitFromSomeGroups(param);
  }
}
