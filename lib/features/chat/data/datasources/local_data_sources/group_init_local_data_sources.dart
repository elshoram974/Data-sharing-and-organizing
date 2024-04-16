import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';

abstract class GroupInitLocalDataSource {
  const GroupInitLocalDataSource();
  double? getFloatingPlace();
  Future<void> saveFloatingPlace(double newTop);
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
}
