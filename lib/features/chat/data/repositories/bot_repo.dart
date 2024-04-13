
import '../../domain/repositories/bot_repo.dart';
import '../datasources/bot_local_data_sources.dart';

class BOTRepositoriesImp extends BOTRepositories {
  const BOTRepositoriesImp(this.localDataSource);
  final BOTLocalDataSource localDataSource;


  @override
  Future<void> saveBottomHeight(double height, int groupId) => localDataSource.saveBottomHeight(height,groupId);

}
