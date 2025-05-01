import 'package:lune/features/core/app_preference/domain/entities/entities.dart';

abstract class AppPreferenceRepository {
  Future<AppPreferenceEntity> loadAppPreference();
  Future<void> saveThemeMode(String mode);
  Future<void> saveTextScaler(double scaler);
  Future<void> saveLocale(String? languageCode);
}
