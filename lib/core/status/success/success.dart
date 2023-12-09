import '../status.dart';

class Success<T> extends Status {
  final T param;
  const Success(this.param);
}
