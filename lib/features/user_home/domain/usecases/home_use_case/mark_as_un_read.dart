import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';

import '../../entities/group_home_entity.dart';
import '../../repositories/home_repositories.dart';

final class MarkAsUnRead extends UseCase<Iterable<int>, List<GroupHomeEntity>> {
  final HomeRepositories homeRepositories;

  const MarkAsUnRead(this.homeRepositories);

  @override
  Future<Status<Iterable<int>>> call(List<GroupHomeEntity> param) {
    return homeRepositories.markAsUnRead(param);
  }
}
