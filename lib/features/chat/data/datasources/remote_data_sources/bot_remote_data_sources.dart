import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../domain/entities/data_in_directory.dart';

abstract class DirectoriesRemoteDataSource {
  const DirectoriesRemoteDataSource();
  Future<DataInDirectory> getDirActInside({
    int? dirId,
    required int groupId,
  });
}

class DirectoriesRemoteDataSourceImp extends DirectoriesRemoteDataSource {
  final APIServices service;

  const DirectoriesRemoteDataSourceImp(this.service);

  @override
  Future<DataInDirectory> getDirActInside({
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
