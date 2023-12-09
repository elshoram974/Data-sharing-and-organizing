import 'dart:async';

import '../status/status.dart';

abstract class UseCase<T, P> {
  FutureOr<({Status status, T data})> call(P param);
}
