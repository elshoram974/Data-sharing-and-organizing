import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/config/themes/app_theme.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency.dart';
import 'package:data_sharing_organizing/features/splash/presentation/cubit/config_cubit.dart';
import 'package:data_sharing_organizing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ClarityApp extends StatelessWidget {
  const ClarityApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigCubit cubit =
        BlocProvider.of<ConfigCubit>(context, listen: true);
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: cubit.appLocale,
      title: S.current.sharikna,
      routerConfig: AppRoute.router,
      theme: AppTheme.lightMode,
      darkTheme: AppTheme.darkMode,
      themeMode: cubit.themeMode,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null || pref.containsKey(AppStrings.locale)) return null;
        final Locale deviceLocale = AppLocale().deviceLocale;
        final bool isSupported = S.delegate.isSupported(deviceLocale);
        if (isSupported) {
          cubit.appLocale = deviceLocale;
          return deviceLocale;
        }
        return null;
      },
    );
  }
}
