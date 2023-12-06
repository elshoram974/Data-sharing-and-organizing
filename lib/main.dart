import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/services/bloc_observer.dart';
import 'package:data_sharing_organizing/clarity_material_app.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency.dart';
import 'package:data_sharing_organizing/features/splash/presentation/cubit/config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    S.load(AppLocale().deviceLocale),
    sharedPref(),
  ]);
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ConfigCubit()),
      ],
      child: const ClarityApp(),
    );
  }
}
