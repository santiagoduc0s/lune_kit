import 'package:lune/features/core/app_preference/data/models/models.dart';

abstract class AppPreferenceRepository {
  Future<AppPreferenceModel> loadAppPreference();
  Future<void> saveThemeMode(String mode);
  Future<void> saveTextScaler(double scaler);
  Future<void> saveLocale(String? languageCode);
}
