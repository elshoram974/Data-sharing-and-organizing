import '../status.dart';

class Failure<T> extends Status<T> {
  final String error;
  final T? data;
  const Failure(this.error, [this.data]);

  Failure<T> copyWith({String? error, T? data}) {
    return Failure(error ?? this.error, data ?? this.data);
  }
}
