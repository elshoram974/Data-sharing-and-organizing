import '../status.dart';

class Failure extends Status {
  final String error;
  const Failure(this.error);
}
