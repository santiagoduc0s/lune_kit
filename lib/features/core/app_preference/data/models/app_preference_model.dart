import 'package:flutter/material.dart';
import 'package:lune/features/core/app_preference/domain/entities/entities.dart';

class AppPreferenceModel {
  AppPreferenceModel({
    required this.themeMode,
    required this.textScaler,
    this.locale,
  });

  factory AppPreferenceModel.fromJson(Map<String, dynamic> json) {
    return AppPreferenceModel(
      themeMode: json['themeMode'] as String? ?? 'system',
      textScaler: json['textScaler'] as double? ?? 1.0,
      locale: json['locale'] as String?,
    );
  }

  /// 'system', 'light', 'dark'
  final String themeMode;

  /// 1.0, 1.5, 2.0
  final double textScaler;

  /// 'en', 'fr', 'es_ES'
  final String? locale;

  AppPreferenceEntity toEntity() {
    return AppPreferenceEntity(
      themeMode: _themeModeFromString(themeMode),
      textScaler: TextScaler.linear(textScaler),
      locale: locale != null ? Locale(locale!) : null,
    );
  }

  ThemeMode _themeModeFromString(String? value) {
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
