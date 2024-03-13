import 'package:data_sharing_organizing/core/status/status.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../entities/upload_file_entity.dart';

abstract class EditProfileRepositories {
  Future<Status<AuthUserEntity>> changeName(int userId, String fName, String lName);
  Future<Status<AuthUserEntity>> changePassword(int userId, String pass, String newPass);
  Future<Status<bool>> deleteAccount(AuthUserEntity user);
  Future<Status<AuthUserEntity>> changeImage(UploadFileEntity uploadedFile);
  Future<Status<AuthUserEntity>> deleteImage(int userId, String imageLink);
}
