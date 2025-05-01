import 'package:lune/features/app_preference/domain/entities/entities.dart';
import 'package:lune/features/app_preference/domain/repositories/repositories.dart';

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

  Future<AppPreferenceEntity> call(SaveTextScalerParams params) async {
    final scaler = params.textScaler;

    if (scaler < 1 || scaler > 3) {
      throw ArgumentError.value(
        scaler,
        'textScaler',
        'Must be between 1 and 3',
      );
    }

    await appPreferenceRepository.saveTextScaler(scaler);
    return appPreferenceRepository.loadAppPreference();
  }
}
