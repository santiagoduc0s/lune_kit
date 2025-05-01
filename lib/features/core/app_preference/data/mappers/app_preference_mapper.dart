import 'package:flutter/material.dart';
import 'package:lune/features/core/app_preference/domain/entities/entities.dart';

abstract class AppPreferenceMapper {
  static AppPreferenceEntity fromJson(Map<String, dynamic> json) {
    return AppPreferenceEntity(
      themeMode: _themeModeFromString(json['themeMode'] as String?),
      textScaler: json['textScaler'] != null
          ? TextScaler.linear((json['textScaler'] as num).toDouble())
          : TextScaler.noScaling,
      locale: json['locale'] != null ? Locale(json['locale'] as String) : null,
    );
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
}
