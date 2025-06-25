import 'package:flutter/material.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/usecases/preference/preference.dart';

class PreferenceNotifier extends ChangeNotifier {
  PreferenceNotifier({
    required GetPreferenceUseCase getPreferenceUseCase,
    required UpdatePreferenceUseCase updatePreferenceUseCase,
  })  : _updatePreferenceUseCase = updatePreferenceUseCase,
        _getPreferenceUseCase = getPreferenceUseCase;

  final GetPreferenceUseCase _getPreferenceUseCase;
  final UpdatePreferenceUseCase _updatePreferenceUseCase;

  PreferenceEntity? prefs;

  Future<void> initialize() async {
    prefs = await _getPreferenceUseCase.call();
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeModePreference mode) async {
    await _updatePreferenceUseCase.call(themeMode: mode);

    prefs = prefs!.copyWith(themeMode: mode);

    notifyListeners();
  }

  Future<void> setTextScaler(double scaler) async {
    await _updatePreferenceUseCase.call(textScaler: scaler);

    prefs = prefs!.copyWith(textScaler: scaler);

    notifyListeners();
  }

  Future<void> setLocale(String? newLocale) async {
    await _updatePreferenceUseCase.call(
      locale: NullableParameter(newLocale),
    );

    prefs = prefs!.copyWith(
      locale: NullableParameter(newLocale),
    );

    notifyListeners();
  }
}
