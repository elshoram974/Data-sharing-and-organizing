import 'dart:async';

import '../status/status.dart';

abstract class UseCase {
  const UseCase();

  FutureOr<Status> call();
}
