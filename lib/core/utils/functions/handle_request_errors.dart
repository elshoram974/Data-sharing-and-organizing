import 'dart:async';
import 'dart:io';

import '../enums/http_exception_type_enum.dart';
import '../exceptions/http_exception.dart';

Future<T> handleRequestErrors<T>(
  Future<T> Function() function,
) async {
  try {
    return await function();
  } catch (e) {
    if (e is SocketException) {
      throw MyHttpException(type: HttpExceptionType.connectionError);
    } else if (e is TimeoutException) {
      throw MyHttpException(type: HttpExceptionType.connectionTimeout);
    } else {
      throw MyHttpException(
        type: HttpExceptionType.unknown,
        message: e.toString(),
      );
    }
  }
}
