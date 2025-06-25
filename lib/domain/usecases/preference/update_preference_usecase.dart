import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class UpdatePreferenceUseCase {
  UpdatePreferenceUseCase({
    required this.preferenceRepository,
  });

  final PreferenceRepository preferenceRepository;

  Future<void> call({
    ThemeModePreference? themeMode,
    double? textScaler,
    NullableParameter<String?>? locale,
  }) {
    return preferenceRepository.savePreference(
      themeMode: themeMode,
      textScaler: textScaler,
      locale: locale,
    );
  }
}
