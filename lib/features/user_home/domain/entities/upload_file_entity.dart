import 'package:http/http.dart' as http;

import '../../../auth/domain/entities/auth_user_entity.dart';

final class UploadFileEntity {
  final AuthUserEntity user;
  final String filePath;
  final http.Client client;
  final void Function(int sent, int total) onProgress;

  UploadFileEntity({
    required this.user,
    required this.filePath,
    required this.client,
    required this.onProgress,
  });
}
