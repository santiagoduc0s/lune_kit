import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// This class is used to manage the app's preferences
/// such as theme mode, text scaling, and locale.
// ignore: must_be_immutable
class AppPreference extends Equatable {
  /// Creates an instance of [AppPreference] with default values.
  AppPreference._singleton()
      : themeMode = ThemeMode.system,
        textScaler = TextScaler.noScaling,
        locale = null;

  /// Singleton instance of [AppPreference].
  static final AppPreference instance = AppPreference._singleton();

  /// Key for storing the theme mode.
  static const String _keyThemeMode = 'themeMode';

  /// Key for storing the theme mode.
  static const String _keyTextScaler = 'textScaler';

  /// Key for storing the locale.
  static const String _keyLocale = 'locale';

  /// Initializes the app preferences.
  void initialize() {
    // light, dark, system
    final storedThemeMode = KeyValueStorage.instance.get<String>(
      _keyThemeMode,
    );

    /// text scaling factor
    final storedTextScaler = KeyValueStorage.instance.get<double>(
      _keyTextScaler,
    );

    /// locale
    final storedLocale = KeyValueStorage.instance.get<String>(
      _keyLocale,
    );

    if (storedThemeMode != null) {
      switch (storedThemeMode) {
        case 'light':
          themeMode = ThemeMode.light;
        case 'dark':
          themeMode = ThemeMode.dark;
        default:
          themeMode = ThemeMode.system;
      }
    }

    if (storedTextScaler != null) {
      textScaler = TextScaler.linear(storedTextScaler);
    }

    if (storedLocale != null) {
      locale = Locale(storedLocale);
    }
  }

  /// Channel to notify changes in app preferences.
  final DataNotifier<AppPreference> notifier = DataNotifier<AppPreference>();

  /// Stream to listen for changes in app preferences.
  Stream<AppPreference> get stream => notifier.stream;

  /// The theme mode of the app.
  ThemeMode themeMode;

  /// The text scaling factor of the app.
  TextScaler textScaler;

  /// The locale of the app.
  Locale? locale;

  /// Set themeMode
  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
    notifier.emit(this);

    switch (mode) {
      case ThemeMode.light:
        KeyValueStorage.instance.save(_keyThemeMode, 'light');
      case ThemeMode.dark:
        KeyValueStorage.instance.save(_keyThemeMode, 'dark');
      case ThemeMode.system:
        KeyValueStorage.instance.save(_keyThemeMode, 'system');
    }
  }

  /// Set textScaler
  void setTextScaler(double scaler) {
    assert(
      scaler >= 1,
      'Text scaling factor must be greater than or equal to 1',
    );

    assert(
      scaler <= 3,
      'Text scaling factor must be less than or equal to 3',
    );

    textScaler = TextScaler.linear(scaler);
    notifier.emit(this);

    KeyValueStorage.instance.save(_keyTextScaler, scaler);
  }

  /// Set locale
  void setLocale(Locale? locale) {
    this.locale = locale;
    notifier.emit(this);
    if (locale != null) {
      KeyValueStorage.instance.save(_keyLocale, locale.languageCode);
    } else {
      KeyValueStorage.instance.remove(_keyLocale);
    }
  }

  @override
  List<Object?> get props => [
        themeMode,
        textScaler,
        locale,
      ];
}
