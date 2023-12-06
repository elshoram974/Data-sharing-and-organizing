import 'dart:async';

import '../errors/status.dart';

abstract class UseCase<T> {
  FutureOr<({Status status, T data})> call();
}
