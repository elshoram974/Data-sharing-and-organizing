import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';

abstract class EditProfileRemoteDataSource {
  const EditProfileRemoteDataSource();
  Future<bool> deleteAccount(AuthUserEntity user);
}

class EditProfileRemoteDataSourceImp extends EditProfileRemoteDataSource {
  final APIServices service;

  const EditProfileRemoteDataSourceImp(this.service);

  @override
  Future<bool> deleteAccount(AuthUserEntity user) async {
    Map<String, dynamic> response = await service.post(
      'AppLinks.delete', // TODO: change delete link
      {'userId': '${user.id}'},
    );
    print(response);
    return response['status'] == 'success';
  }
}
