import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class GetPreferenceUseCase {
  GetPreferenceUseCase({
    required PreferenceRepository preferenceRepository,
  }) : _preferenceRepository = preferenceRepository;

  final PreferenceRepository _preferenceRepository;

  Future<PreferenceEntity> call() {
    return _preferenceRepository.getPreference();
  }
}
