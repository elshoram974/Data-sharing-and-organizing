import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../../../auth/data/models/app_user/app_user.dart';
import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../domain/entities/upload_file_entity.dart';

abstract class EditProfileRemoteDataSource {
  const EditProfileRemoteDataSource();
  Future<bool> deleteAccount(AuthUserEntity user);
  Future<AuthUserEntity> changePass(int userId, String pass, String newPass);
  Future<AuthUserEntity> changeName(int userId, String fName, String lName);
  Future<AuthUserEntity> changeImage(UploadFileEntity uploadImageEntity);
  Future<AuthUserEntity> deleteImage(int userId, String imageLink);
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
  Future<AuthUserEntity> changePass(
      int userId, String pass, String newPass) async {
    Map<String, dynamic> response = await service.post(
      'AppLinks.change pass', // TODO: change pass link
      {'userId': '$userId', 'currentPass': pass, 'newPass': newPass},
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<AuthUserEntity> changeName(int userId, String fName, String lName) async {
    Map<String, dynamic> response = await service.post(
      'AppLinks.change name', // TODO: change name link
      {'userId': '$userId', 'first_name': fName, 'last_name': lName},
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<AuthUserEntity> changeImage(UploadFileEntity uploadImageEntity) async {
     Map<String, dynamic> response = await service.uploadFile(
      link: 'link', // TODO: add change link
      fieldName: 'image', // TODO: make sure the field name is image
      filePath: uploadImageEntity.filePath,
      body: {'userId': uploadImageEntity.user.id},
      client: uploadImageEntity.client,
      onProgress: uploadImageEntity.onProgress,
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<AuthUserEntity> deleteImage(int userId, String imageLink) async {
    Map<String, dynamic> response = await service.post(
      'AppLinks.change name', // TODO: change name link
      {'userId': '$userId', 'imageLink': imageLink},
    );
    return AppUser.fromMap(response).user!;
  }
}
