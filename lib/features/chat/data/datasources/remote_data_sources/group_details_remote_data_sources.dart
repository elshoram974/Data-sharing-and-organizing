import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

abstract class GroupDetailsRemoteDataSource {
  const GroupDetailsRemoteDataSource();

  getGroupMembers(int groupId) {}
}

class GroupDetailsRemoteDataSourceImp extends GroupDetailsRemoteDataSource {
  final APIServices service;

  const GroupDetailsRemoteDataSourceImp(this.service);
}
