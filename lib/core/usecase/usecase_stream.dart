import '../status/status.dart';

abstract class UseCase<T, P> {
  const UseCase();
  Stream<Status<T>> call(P param);
}
