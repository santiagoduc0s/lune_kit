abstract class AppPreferenceDatasource {
  String? getThemeModeKey();

  double? getTextScaler();

  String? getLocaleCode();

  Future<void> setThemeModeKey(String key);

  Future<void> setTextScaler(double scaler);

  Future<void> setLocaleCode(String? code);
}
