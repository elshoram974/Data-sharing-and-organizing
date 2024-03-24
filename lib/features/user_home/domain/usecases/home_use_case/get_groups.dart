import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../entities/group_home_entity.dart';
import '../../repositories/home_repositories.dart';

final class GetGroupsUseCase extends UseCase<List<GroupHomeEntity>,
    ({AuthUserEntity user, bool getMyGroups})> {
  final HomeRepositories homeRepositories;

  const GetGroupsUseCase(this.homeRepositories);

  @override
  Future<Status<List<GroupHomeEntity>>> call(
      ({AuthUserEntity user, bool getMyGroups}) param) {
    if (param.getMyGroups) {
      return homeRepositories.getMyGroups(param.user);
    }
    return homeRepositories.getGroups(param.user);
  }
}
