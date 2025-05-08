import 'package:lune/features/core/app_preference/data/datasources/datasources.dart';
import 'package:lune/features/core/app_preference/data/models/models.dart';
import 'package:lune/features/core/app_preference/domain/repositories/repositories.dart';

class AppPreferenceRepositoryImpl extends AppPreferenceRepository {
  AppPreferenceRepositoryImpl(
    this.datasource,
  );

  AppPreferenceDatasource datasource;

  @override
  Future<AppPreferenceModel> loadAppPreference() async {
    final themeKey = datasource.getThemeModeKey();
    final scaler = datasource.getTextScaler();
    final localeCode = datasource.getLocaleCode();

    return AppPreferenceModel.fromJson({
      'themeMode': themeKey,
      'textScaler': scaler,
      'locale': localeCode,
    });
  }

  @override
  Future<void> saveLocale(String? languageCode) {
    return datasource.setLocaleCode(languageCode);
  }

  @override
  Future<void> saveTextScaler(double scaler) {
    return datasource.setTextScaler(scaler);
  }

  @override
  Future<void> saveThemeMode(String mode) {
    return datasource.setThemeModeKey(mode);
  }
}
