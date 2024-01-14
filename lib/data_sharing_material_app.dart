import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/config/themes/app_theme.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_snake_bar.dart';
import 'package:data_sharing_organizing/features/splash/presentation/cubit/config_cubit.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DataSharingApp extends StatelessWidget {
  const DataSharingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit c = BlocProvider.of<ConfigCubit>(context, listen: true);
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: c.appLocale,
      title: S.current.sharikna,
      routerConfig: AppRoute.router,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: c.themeMode,
      builder: EasyLoading.init(),
      scaffoldMessengerKey: ScaffoldKey.call,
      localeResolutionCallback: (l, _) =>
          AppLocale.localeResolutionCallback(l, c),
    );
  }
}
