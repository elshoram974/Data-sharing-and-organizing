
import '../../../auth/domain/entities/auth_user_entity.dart';

final class UploadFileEntity {
  final AuthUserEntity user;
  final String filePath;

  UploadFileEntity({
    required this.user,
    required this.filePath,
  });
}
