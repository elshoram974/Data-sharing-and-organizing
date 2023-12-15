import '../status.dart';

class Failure<T> extends Status<T> {
  final String error;
  const Failure(this.error);
}
