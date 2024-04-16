import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:hive/hive.dart';

import '../../../../user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../user_home/domain/entities/group_home_entity.dart';

abstract class DirectoriesLocalDataSource {
  const DirectoriesLocalDataSource();
  Future<void> saveBottomHeight(double height, int groupId);
}

class DirectoriesLocalDataSourceImp extends DirectoriesLocalDataSource {
  DirectoriesLocalDataSourceImp(this.homeLocal);
  final HomeLocalDataSource homeLocal;

  late final Box<GroupHomeEntity> groupsBox = Hive.box<GroupHomeEntity>(AppStrings.groupsBox);

  @override
  Future<void> saveBottomHeight(double height, int groupId) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(_getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groups[i].id == groupId) {
        groups[i] = groups[i].copyWith(bottomHeight: height);
        await _removeAllGroups();
        await groupsBox.addAll(groups);
        ProviderDependency.userHome.updateGroupLocally(groups[i]);
        return;
      }
    }
  }

  // For that i need in home
  List<GroupHomeEntity> _getAllGroups() => homeLocal.getAllGroups();
  Future<int> _removeAllGroups() => homeLocal.removeAllGroups();
}
