import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';

abstract class BOTLocalDataSource {
  const BOTLocalDataSource();
  Future<void> saveBottomHeight(double height , int groupId);
}

class BOTLocalDataSourceImp extends BOTLocalDataSource {
  BOTLocalDataSourceImp();

  @override
  Future<void> saveBottomHeight(double height , int groupId) {
    return config.put(AppStrings.floatingButtonPlace, 'newTop');
  }
}
