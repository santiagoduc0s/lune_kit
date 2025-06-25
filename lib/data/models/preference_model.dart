import 'package:lune/domain/entities/entities.dart';

class PreferenceModel extends PreferenceEntity {
  const PreferenceModel({
    required super.themeMode,
    required super.textScaler,
    super.locale,
  });

  factory PreferenceModel.fromJson(Map<String, dynamic> json) {
    return PreferenceModel(
      themeMode: _themeModeFromString(json['themeMode'] as String?),
      textScaler: (json['textScaler'] as num?)?.toDouble() ?? 1.0,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'themeMode': _stringFromThemeMode(themeMode),
      'textScaler': textScaler,
      'locale': locale,
    };
  }

  static ThemeModePreference _themeModeFromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeModePreference.light;
      case 'dark':
        return ThemeModePreference.dark;
      default:
        return ThemeModePreference.system;
    }
  }

  static String _stringFromThemeMode(ThemeModePreference mode) {
    switch (mode) {
      case ThemeModePreference.light:
        return 'light';
      case ThemeModePreference.dark:
        return 'dark';
      case ThemeModePreference.system:
        return 'system';
    }
  }
}
