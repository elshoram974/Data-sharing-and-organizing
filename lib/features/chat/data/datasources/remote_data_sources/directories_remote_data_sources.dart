import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../domain/entities/directory_entity.dart';

abstract class DirectoriesRemoteDataSource {
  const DirectoriesRemoteDataSource();
  Future<List<DirectoryEntity>> getDirectoriesInside({
    int? dirId,
    required int groupId,
  });
}

class DirectoriesRemoteDataSourceImp extends DirectoriesRemoteDataSource {
  final APIServices service;

  const DirectoriesRemoteDataSourceImp(this.service);

  @override
  Future<List<DirectoryEntity>> getDirectoriesInside({
    int? dirId,
    required int groupId,
  }) async {
    Map<String, dynamic> response = await service.post(
      "AppLinks.getDirectoriesInside",
      {'dir': '$dirId', 'groupId': '$groupId'},
    );
    // TODO: write code of getting directories here
    throw UnimplementedError(response.toString());
  }
}
