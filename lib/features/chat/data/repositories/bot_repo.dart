
import '../../domain/repositories/directories_repo.dart';
import '../datasources/local_data_sources/directories_local_data_sources.dart';

class DirectoriesRepositoriesImp extends DirectoriesRepositories {
  const DirectoriesRepositoriesImp(this.localDataSource);
  final DirectoriesLocalDataSource localDataSource;


  @override
  Future<void> saveBottomHeight(double height, int groupId) => localDataSource.saveBottomHeight(height,groupId);

}
