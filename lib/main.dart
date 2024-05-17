import 'dart:io';

import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/services/bloc_observer.dart';
import 'package:data_sharing_organizing/core/utils/services/notification/notification_services.dart';
import 'package:data_sharing_organizing/core/utils/services/social_services.dart';
import 'package:data_sharing_organizing/data_sharing_material_app.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';
import 'package:data_sharing_organizing/features/splash/presentation/cubit/config_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'features/user_home/presentation/cubit/menu_cubits/change_photo/change_photo_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    S.load(AppLocale().deviceLocale),
    localInstance(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  ]);

  initDependencies();

  await initAppConfiguration();

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
        BlocProvider(create: (context) => sl.get<ChangePhotoCubit>()),
      ],
      child: const DataSharingApp(),
    );
  }
}

late DateTime timeBackPressed;

Future<void> initAppConfiguration() async {
  if (kDebugMode) HttpOverrides.global = MyHttpOverrides();
  timeBackPressed = DateTime.now();

  sl.get<NotificationApi>().init();
  await sl.get<SocialServices>().authConfiguration();

  Bloc.observer = MyBlocObserver();

  EasyLoading.instance
    ..userInteractions = false
    ..dismissOnTap = true;
}
