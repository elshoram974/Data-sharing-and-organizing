import 'dart:io';

import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/services/bloc_observer.dart';
import 'package:data_sharing_organizing/data_sharing_material_app.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';
import 'package:data_sharing_organizing/features/splash/presentation/cubit/config_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/cubit/login_cubit/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) HttpOverrides.global = MyHttpOverrides();

  await Future.wait([
    S.load(AppLocale().deviceLocale),
    localInstance(),
  ]);
  Bloc.observer = MyBlocObserver();
  initDependencies();

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<ConfigCubit>()),
        BlocProvider(create: (context) => sl.get<LoginCubit>()),
      ],
      child: const DataSharingApp(),
    );
  }
}
