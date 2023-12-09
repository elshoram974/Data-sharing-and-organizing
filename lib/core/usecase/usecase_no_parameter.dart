import 'dart:async';

import '../status/status.dart';

abstract class UseCase<T> {
  FutureOr<({Status status, T data})> call();
}
