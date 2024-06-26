import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../status/errors/failure.dart';
import '../../status/errors/failure_body.dart';
import '../../status/status.dart';
import '../../status/success/success.dart';

void failureStatus(String error, void Function() emit) {
  emit();
  EasyLoading.showError(error, duration: const Duration(seconds: 5));
}

Future<void> handleStatusEmit<T>({
  required final Future<Status<T>> Function() statusFunction,
  required void Function(T data) successFunction,
  void Function(FailureBody failure)? failureFunction,
  bool? dismissLoadingOnTap = false,
}) async {
  if (dismissLoadingOnTap != null) {
    EasyLoading.show(dismissOnTap: dismissLoadingOnTap);
  }
  final Status<T> status = await statusFunction();
  if (dismissLoadingOnTap != null) await EasyLoading.dismiss();
  if (status is Success<T>) {
    successFunction(status.data);
  } else {
    status as Failure<T>;
    if (failureFunction != null) failureFunction(status.failure);
    EasyLoading.showError(
      status.failure.message,
      duration: const Duration(seconds: 5),
    );
  }
}
