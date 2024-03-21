import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';

final class UploadFileEntity {
  final AuthUserEntity user;
  final MyFileData file;

  UploadFileEntity({
    required this.user,
    required this.file,
  });
}
