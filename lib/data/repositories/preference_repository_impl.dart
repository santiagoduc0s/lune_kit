import 'package:lune/core/utils/parameter.dart';
import 'package:lune/data/models/models.dart';
import 'package:lune/data/services/services.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class PreferenceRepositoryImpl extends PreferenceRepository {
  PreferenceRepositoryImpl({
    required LocalStorageService service,
  }) : _service = service;

  final LocalStorageService _service;

  @override
  Future<PreferenceModel> getPreference() async {
    final results = await Future.wait([
      _service.getThemeModeKey(),
      _service.getTextScaler(),
      _service.getLocaleCode(),
    ]);

    return PreferenceModel.fromJson({
      'themeMode': results[0],
      'textScaler': results[1],
      'locale': results[2],
    });
  }

  @override
  Future<void> savePreference({
    ThemeModePreference? themeMode,
    double? textScaler,
    NullableParameter<String?>? locale,
  }) async {
    final futures = <Future<dynamic>>[];

    if (themeMode != null) {
      switch (themeMode) {
        case ThemeModePreference.system:
          futures.add(_service.setThemeModeKey('system'));
        case ThemeModePreference.light:
          futures.add(_service.setThemeModeKey('light'));
        case ThemeModePreference.dark:
          futures.add(_service.setThemeModeKey('dark'));
      }
    }
    if (textScaler != null) {
      futures.add(_service.setTextScaler(textScaler));
    }
    if (locale != null) {
      futures.add(_service.setLocaleCode(locale.value));
    }

    await Future.wait(futures);
  }
}
