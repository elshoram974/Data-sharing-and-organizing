import 'dart:async';

import '../status/status.dart';

abstract class UseCase<T, P> {
  const UseCase();
  FutureOr<Status<T>> call(P param);
}
