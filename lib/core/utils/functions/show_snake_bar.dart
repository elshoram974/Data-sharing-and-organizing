import 'package:flutter/material.dart';

abstract final class ScaffoldKey {
  static final GlobalKey<ScaffoldMessengerState> call =
      GlobalKey<ScaffoldMessengerState>();

  static void showTesterSnakeBar(String message) {
    call.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
