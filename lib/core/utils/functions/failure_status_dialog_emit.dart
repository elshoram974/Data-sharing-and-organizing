import 'package:flutter_easyloading/flutter_easyloading.dart';

void failureStatus(String error, void Function() emit) {
  emit();
  EasyLoading.showError(error, duration: const Duration(seconds: 5));
}
