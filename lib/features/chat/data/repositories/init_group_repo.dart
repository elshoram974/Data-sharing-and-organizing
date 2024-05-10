import '../../domain/repositories/init_group_repo.dart';
import '../datasources/local_data_sources/group_init_local_data_sources.dart';

class GroupInitRepositoriesImp extends GroupInitRepositories {
  const GroupInitRepositoriesImp(this.localDataSource);
  final GroupInitLocalDataSource localDataSource;

  @override
  double getButtonPlace() => localDataSource.getFloatingPlace() ?? 0;

  @override
  Future<void> saveButtonPlace(double newTop) =>
      localDataSource.saveFloatingPlace(newTop);
}
