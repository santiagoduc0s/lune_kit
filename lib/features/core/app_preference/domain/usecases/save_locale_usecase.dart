import 'package:lune/features/core/app_preference/domain/entities/entities.dart';
import 'package:lune/features/core/app_preference/domain/repositories/repositories.dart';

class SaveLocaleUseCase {
  SaveLocaleUseCase({
    required this.appPreferenceRepository,
  });

  final AppPreferenceRepository appPreferenceRepository;

  Future<AppPreferenceEntity> call(String? locale) async {
    await appPreferenceRepository.saveLocale(locale);
    return appPreferenceRepository.loadAppPreference();
  }
}
