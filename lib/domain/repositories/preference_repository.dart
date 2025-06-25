import 'package:lune/core/utils/utils.dart';
import 'package:lune/data/models/models.dart';
import 'package:lune/domain/entities/entities.dart';

abstract class PreferenceRepository {
  Future<PreferenceModel> getPreference();
  Future<void> savePreference({
    ThemeModePreference? themeMode,
    double? textScaler,
    NullableParameter<String?>? locale,
  });
}
