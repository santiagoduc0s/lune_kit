import 'package:lune/features/core/app_preference/domain/entities/entities.dart';
import 'package:lune/features/core/app_preference/domain/repositories/repositories.dart';

class SaveLocaleParams {
  const SaveLocaleParams({
    required this.locale,
  });

  final String? locale;
}

class SaveLocaleUseCase {
  SaveLocaleUseCase({
    required this.appPreferenceRepository,
  });

  final AppPreferenceRepository appPreferenceRepository;

  Future<AppPreferenceEntity> call(SaveLocaleParams params) async {
    await appPreferenceRepository.saveLocale(params.locale);
    return appPreferenceRepository.loadAppPreference();
  }
}
