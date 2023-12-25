import '../../status/errors/failure.dart';
import '../../status/errors/server_failure.dart';
import '../../status/status.dart';
import '../../status/success/success.dart';
import '../exceptions/http_exception.dart';

Future<Status<T>> executeAndHandleErrors<T>(
  Future<T> Function() function,
) async {
  try {
    return Success(await function());
  } catch (e) {
    if (e is MyHttpException) return ServerFailure.fromHttpException(e);

    return Failure(e.toString());
  }
}
