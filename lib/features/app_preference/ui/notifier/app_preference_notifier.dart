import 'package:flutter/material.dart';
import 'package:lune/features/app_preference/domain/entities/entities.dart';
import 'package:lune/features/app_preference/domain/usecases/usecases.dart';

class AppPreferenceNotifier extends ChangeNotifier {
  AppPreferenceNotifier({
    required this.loadAppPreferenceUseCase,
    required this.saveThemeModeUseCase,
    required this.saveTextScalerUseCase,
    required this.saveLocaleUseCase,
  });

  final LoadAppPreferenceUseCase loadAppPreferenceUseCase;
  final SaveThemeModeUseCase saveThemeModeUseCase;
  final SaveTextScalerUseCase saveTextScalerUseCase;
  final SaveLocaleUseCase saveLocaleUseCase;

  late AppPreferenceEntity prefs;

  Future<void> initialize() async {
    prefs = await loadAppPreferenceUseCase.call();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final key = mode == ThemeMode.light
        ? 'light'
        : mode == ThemeMode.dark
            ? 'dark'
            : 'system';

    prefs = await saveThemeModeUseCase.call(
      SaveThemeModeParams(themeMode: key),
    );

    notifyListeners();
  }

  Future<void> setTextScaler(double scaler) async {
    await saveTextScalerUseCase.call(
      SaveTextScalerParams(textScaler: scaler),
    );

    prefs = prefs.copyWith(textScaler: TextScaler.linear(scaler));

    notifyListeners();
  }

  Future<void> setLocale(Locale? newLocale) async {
    await saveLocaleUseCase.call(
      SaveLocaleParams(locale: newLocale?.toLanguageTag()),
    );

    prefs = await saveLocaleUseCase.call(
      SaveLocaleParams(locale: newLocale?.toLanguageTag()),
    );

    notifyListeners();
  }
}
