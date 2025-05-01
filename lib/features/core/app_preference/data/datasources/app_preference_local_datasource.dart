import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/app_preference/data/datasources/datasources.dart';

class AppPreferenceLocalDatasource extends AppPreferenceDatasource {
  AppPreferenceLocalDatasource(this._storage);

  static const _keyTheme = 'themeMode';
  static const _keyScale = 'textScaler';
  static const _keyLocale = 'locale';

  final KeyValueLocalStorage _storage;

  @override
  String? getThemeModeKey() => _storage.get<String>(_keyTheme);

  @override
  double? getTextScaler() => _storage.get<double>(_keyScale);

  @override
  String? getLocaleCode() => _storage.get<String>(_keyLocale);

  @override
  Future<void> setThemeModeKey(String key) {
    return _storage.save(_keyTheme, key);
  }

  @override
  Future<void> setTextScaler(double scaler) {
    return _storage.save(_keyScale, scaler);
  }

  @override
  Future<void> setLocaleCode(String? code) {
    if (code != null) {
      return _storage.save(_keyLocale, code);
    } else {
      return _storage.remove(_keyLocale);
    }
  }
}
