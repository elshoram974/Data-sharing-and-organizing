import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../auth/data/models/app_user/app_user.dart';
import '../../../../auth/domain/entities/auth_user_entity.dart';

abstract class EditProfileRemoteDataSource {
  const EditProfileRemoteDataSource();
  Future<bool> deleteAccount(AuthUserEntity user);
  Future<AuthUserEntity> changePass(int userId, String pass, String newPass);
}

class EditProfileRemoteDataSourceImp extends EditProfileRemoteDataSource {
  final APIServices service;

  const EditProfileRemoteDataSourceImp(this.service);

  @override
  Future<bool> deleteAccount(AuthUserEntity user) async {
    Map<String, dynamic> response = await service.post(
      'AppLinks.delete', // TODO: delete link
      {'userId': '${user.id}'},
    );
    print(response);
    return response['status'] == 'success';
  }

  @override
  Future<AuthUserEntity> changePass(int userId, String pass, String newPass) async {
    Map<String, dynamic> response = await service.post(
      'AppLinks.change pass', // TODO: change pass link
      {'userId': '$userId', 'currentPass': pass, 'newPass': newPass},
    );
    return AppUser.fromMap(response).user!;
  }
}
