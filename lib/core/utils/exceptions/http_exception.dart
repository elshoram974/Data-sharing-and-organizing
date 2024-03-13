import '../enums/http_exception_type_enum.dart';
import '../extension/http_exception_type_ex.dart';

class MyHttpException<T> implements Exception {
  /// Prefer using one of the other constructors.
  /// They're most likely better fitting.
  MyHttpException({
    this.response,
    this.type = HttpExceptionType.unknown,
    this.error,
    StackTrace? stackTrace,
    this.message,
  }) : stackTrace = identical(stackTrace, StackTrace.empty)
            ? StackTrace.current
            : stackTrace ?? StackTrace.current;

  factory MyHttpException.badResponse({
    required int statusCode,
    required,
    required T response,
  }) =>
      MyHttpException(
        type: HttpExceptionType.badResponse,
        message: _badResponseExceptionMessage(statusCode),
        response: response,
        error: null,
      );

  factory MyHttpException.connectionTimeout({
    required Duration timeout,
    Object? error,
  }) =>
      MyHttpException(
        type: HttpExceptionType.connectionTimeout,
        message: 'The request connection took longer than $timeout '
            'and it was aborted. '
            'To get rid of this exception, try raising the '
            '.connectTimeout above the duration of $timeout or '
            'improve the response time of the server.',
        response: null,
        error: error,
      );

  factory MyHttpException.sendTimeout({
    required Duration timeout,
    required,
  }) =>
      MyHttpException(
        type: HttpExceptionType.sendTimeout,
        message: 'The request took longer than $timeout to send data. '
            'It was aborted. '
            'To get rid of this exception, try raising the '
            '.sendTimeout above the duration of $timeout or '
            'improve the response time of the server.',
        response: null,
        error: null,
      );

  factory MyHttpException.receiveTimeout({
    required Duration timeout,
    required,
    Object? error,
  }) =>
      MyHttpException(
        type: HttpExceptionType.receiveTimeout,
        message: 'The request took longer than $timeout to receive data. '
            'It was aborted. '
            'To get rid of this exception, try raising the '
            'receiveTimeout above the duration of $timeout or '
            'improve the response time of the server.',
        response: null,
        error: error,
      );

  factory MyHttpException.requestCancelled({
    required,
    required Object? reason,
    StackTrace? stackTrace,
  }) =>
      MyHttpException(
        type: HttpExceptionType.cancel,
        message: 'The request was manually cancelled by the user.',
        response: null,
        error: reason,
        stackTrace: stackTrace,
      );

  factory MyHttpException.connectionError({
    required,
    required String reason,
    Object? error,
  }) =>
      MyHttpException(
        type: HttpExceptionType.connectionError,
        message: 'The connection errored: $reason '
            'This indicates an error which most likely cannot be solved by the library.',
        response: null,
        error: error,
      );

  final T? response;

  final HttpExceptionType type;

  final Object? error;
  final StackTrace stackTrace;
  final String? message;

  @override
  String toString() {
    String msg = 'HttpException [${type.toPrettyDescription()}]: $message';
    if (error != null) {
      msg += '\nError: $error';
    }
    return msg;
  }

  /// Because of [ValidateStatus] we need to consider all status codes when
  /// creating a [httpException.badResponse].
  static String _badResponseExceptionMessage(int statusCode) {
    final String message;
    if (statusCode >= 100 && statusCode < 200) {
      message =
          'This is an informational response - the request was received, continuing processing';
    } else if (statusCode >= 200 && statusCode < 300) {
      message =
          'The request was successfully received, understood, and accepted';
    } else if (statusCode >= 300 && statusCode < 400) {
      message =
          'Redirection: further action needs to be taken in order to complete the request';
    } else if (statusCode >= 400 && statusCode < 500) {
      message =
          'Client error - the request contains bad syntax or cannot be fulfilled';
    } else if (statusCode >= 500 && statusCode < 600) {
      message =
          'Server error - the server failed to fulfil an apparently valid request';
    } else {
      message =
          'A response with a status code that is not within the range of inclusive 100 to exclusive 600'
          'is a non-standard response, possibly due to the server\'s software';
    }

    final buffer = StringBuffer();

    buffer.writeln(
      'This exception was thrown because the response has a status code of $statusCode '
      'and .validateStatus was configured to throw for this status code.',
    );
    buffer.writeln(
      'The status code of $statusCode has the following meaning: "$message"',
    );
    buffer.writeln(
      'Read more about status codes at https://developer.mozilla.org/en-US/docs/Web/HTTP/Status',
    );
    buffer.writeln(
      'In order to resolve this exception you typically have either to verify '
      'and fix your request code or you have to fix the server code.',
    );

    return buffer.toString();
  }
}
