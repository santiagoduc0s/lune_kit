import 'package:flutter/material.dart';
import 'package:lune/features/core/app_preference/domain/entities/entities.dart';

class AppPreferenceModel extends AppPreferenceEntity {
  const AppPreferenceModel({
    required super.themeMode,
    required super.textScaler,
    super.locale,
  });

  factory AppPreferenceModel.fromJson(Map<String, dynamic> json) {
    final mode = _themeModeFromString(json['themeMode'] as String?);
    final scale = (json['textScaler'] as num?)?.toDouble() ?? 1.0;
    final localeTag = json['locale'] as String?;

    return AppPreferenceModel(
      themeMode: mode,
      textScaler: TextScaler.linear(scale),
      locale: localeTag != null ? Locale(localeTag) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'themeMode': _stringFromThemeMode(themeMode),
      'textScaler': textScaler.scale,
      'locale': locale?.toLanguageTag(),
    };
  }

  static ThemeMode _themeModeFromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static String _stringFromThemeMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
