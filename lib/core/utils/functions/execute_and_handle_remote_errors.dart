import '../../status/errors/failure.dart';
import '../../status/errors/failure_body.dart';
import '../../status/errors/server_failure.dart';
import '../../status/status.dart';
import '../../status/success/success.dart';
import '../exceptions/http_exception.dart';

Future<Status<T>> executeAndHandleErrors<T>(
  Future<T> Function() function, [
  Future<T?> Function()? functionWhenError,
]) async {
  try {
    return Success<T>(await function());
  } catch (e) {
    T? data;
    if (functionWhenError != null) data = await functionWhenError();

    if (e is MyHttpException) {
      return ServerFailure<T>.fromHttpException(e).copyWith(data: data);
    }

    return Failure<T>(FailureBody(message: e.toString()), data);
  }
}
