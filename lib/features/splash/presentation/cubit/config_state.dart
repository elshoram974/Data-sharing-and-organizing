part of 'config_cubit.dart';

sealed class ConfigState extends Equatable {
  const ConfigState();

  @override
  List<Object> get props => [];
}

final class ConfigInitial extends ConfigState {
  const ConfigInitial();
}

final class ChangeThemeMode extends ConfigState {
  final ThemeMode mode;
  const ChangeThemeMode(this.mode);

  @override
  List<ThemeMode> get props => [mode];
}

final class ChangeLanguage extends ConfigState {
  final String languageCode;
  const ChangeLanguage(this.languageCode);

  @override
  List<String> get props => [languageCode];
}
