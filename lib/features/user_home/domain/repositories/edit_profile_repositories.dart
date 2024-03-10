import 'package:data_sharing_organizing/core/status/status.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';

abstract class EditProfileRepositories {
  Future<Status<AuthUserEntity>> changePassword(int userId, String pass, String newPass);
  Future<Status<bool>> deleteAccount(AuthUserEntity user);
}
