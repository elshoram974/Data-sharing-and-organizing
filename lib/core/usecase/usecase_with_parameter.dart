import 'dart:async';

import '../errors/status.dart';

abstract class UseCase<T, P> {
  FutureOr<({Status status, T data})> call(P param);
}
