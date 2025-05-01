import 'package:lune/features/core/app_preference/domain/entities/entities.dart';
import 'package:lune/features/core/app_preference/domain/repositories/repositories.dart';

class LoadAppPreferenceUseCase {
  LoadAppPreferenceUseCase({
    required this.appPreferenceRepository,
  });

  final AppPreferenceRepository appPreferenceRepository;

  Future<AppPreferenceEntity> call() {
    return appPreferenceRepository.loadAppPreference();
  }
}
