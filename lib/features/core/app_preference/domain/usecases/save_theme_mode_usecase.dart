import 'package:lune/features/core/app_preference/domain/entities/entities.dart';
import 'package:lune/features/core/app_preference/domain/repositories/repositories.dart';

class SaveThemeModeParams {
  const SaveThemeModeParams({
    required this.themeMode,
  });

  final String themeMode;
}

class SaveThemeModeUseCase {
  SaveThemeModeUseCase({
    required this.appPreferenceRepository,
  });

  final AppPreferenceRepository appPreferenceRepository;

  Future<AppPreferenceEntity> call(SaveThemeModeParams params) async {
    await appPreferenceRepository.saveThemeMode(params.themeMode);
    return appPreferenceRepository.loadAppPreference();
  }
}
