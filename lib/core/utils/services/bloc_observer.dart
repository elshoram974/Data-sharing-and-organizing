import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('create: ${bloc.toString()}');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('Change: ${change.toString()}');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    log('close: ${bloc.toString()}');
    super.onClose(bloc);
  }
}
