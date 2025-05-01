import 'package:lune/features/core/app_preference/domain/entities/entities.dart';
import 'package:lune/features/core/app_preference/domain/repositories/repositories.dart';

class SaveTextScalerParams {
  const SaveTextScalerParams({
    required this.textScaler,
  });

  final double textScaler;
}

class SaveTextScalerUseCase {
  SaveTextScalerUseCase({
    required this.appPreferenceRepository,
  });

  final AppPreferenceRepository appPreferenceRepository;

  Future<AppPreferenceEntity> call(double textScaler) async {
    if (textScaler < 1 || textScaler > 3) {
      throw ArgumentError.value(
        textScaler,
        'textScaler',
        'Must be between 1 and 3',
      );
    }

    await appPreferenceRepository.saveTextScaler(textScaler);
    return appPreferenceRepository.loadAppPreference();
  }
}
