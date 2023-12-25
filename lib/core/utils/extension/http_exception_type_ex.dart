import '../enums/http_exception_type_enum.dart';

extension HttpExceptionTypeExtension on HttpExceptionType {
  String toPrettyDescription() {
    switch (this) {
      case HttpExceptionType.connectionTimeout:
        return 'connection timeout';
      case HttpExceptionType.sendTimeout:
        return 'send timeout';
      case HttpExceptionType.receiveTimeout:
        return 'receive timeout';
      case HttpExceptionType.badCertificate:
        return 'bad certificate';
      case HttpExceptionType.badResponse:
        return 'bad response';
      case HttpExceptionType.cancel:
        return 'request cancelled';
      case HttpExceptionType.connectionError:
        return 'connection error';
      case HttpExceptionType.unknown:
        return 'unknown';
    }
  }
}
