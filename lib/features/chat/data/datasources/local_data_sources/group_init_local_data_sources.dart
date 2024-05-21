import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';

import '../../../../user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../user_home/data/datasources/home_datasources/notification_local_data_sources.dart';

abstract class GroupInitLocalDataSource {
  const GroupInitLocalDataSource();
  double? getFloatingPlace();
  Future<void> saveFloatingPlace(double newTop);
  Future<void> makeSeenToGroup(int groupId);
}

class GroupInitLocalDataSourceImp extends GroupInitLocalDataSource {
  const GroupInitLocalDataSourceImp();

  @override
  double? getFloatingPlace() {
    return double.tryParse('${config.get(AppStrings.floatingButtonPlace)}');
  }

  @override
  Future<void> saveFloatingPlace(double newTop) {
    return config.put(AppStrings.floatingButtonPlace, '$newTop');
  }

  @override
  Future<void> makeSeenToGroup(int groupId) {
    return Future.wait([
      sl.get<HomeLocalDataSource>().makeSeenToGroup(groupId),
      sl
          .get<NotificationLocalDataSource>()
          .makeSeenToGroupNotifications(groupId),
    ]);
  }
}
