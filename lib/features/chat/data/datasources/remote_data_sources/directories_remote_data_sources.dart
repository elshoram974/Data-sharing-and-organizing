import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../domain/entities/directory_entity.dart';

abstract class DirectoriesRemoteDataSource {
  const DirectoriesRemoteDataSource();
  Future<DirectoryEntity> getDirectoriesInside([int? dirId]);
}

class DirectoriesRemoteDataSourceImp extends DirectoriesRemoteDataSource {
  final APIServices service;

  const DirectoriesRemoteDataSourceImp(this.service);

  @override
  Future<DirectoryEntity> getDirectoriesInside([int? dirId]) async {
    Map<String, dynamic> response = await service.post(
      "AppLinks.getDirectoriesInside",
      {'dir': '$dirId'},
    );
    // TODO: write code of getting directories here
    throw UnimplementedError(response.toString());
  }
}
