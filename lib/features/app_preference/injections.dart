import 'package:core/core.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/app_preference/data/datasources/datasources.dart';
import 'package:lune/features/app_preference/data/repositories/repositories.dart';
import 'package:lune/features/app_preference/domain/repositories/repositories.dart';
import 'package:lune/features/app_preference/domain/usecases/usecases.dart';
import 'package:lune/features/app_preference/ui/notifier/notifier.dart';

Future<void> appPreferenceInjections() async {
  /// DATASOURCE
  Injector.registerSingleton<AppPreferenceDatasource>(
    AppPreferenceLocalDatasource(
      Injector.findSingleton<KeyValueLocalStorage>(),
    ),
  );

  /// REPOSITORY
  Injector.registerSingleton<AppPreferenceRepository>(
    AppPreferenceRepositoryImpl(
      Injector.findSingleton<AppPreferenceDatasource>(),
    ),
  );

  /// USE CASES
  Injector.registerSingleton<LoadAppPreferenceUseCase>(
    LoadAppPreferenceUseCase(
      appPreferenceRepository: Injector.findSingleton(),
    ),
  );

  Injector.registerSingleton<SaveTextScalerUseCase>(
    SaveTextScalerUseCase(
      appPreferenceRepository: Injector.findSingleton(),
    ),
  );

  Injector.registerSingleton<SaveThemeModeUseCase>(
    SaveThemeModeUseCase(
      appPreferenceRepository: Injector.findSingleton(),
    ),
  );

  Injector.registerSingleton<SaveLocaleUseCase>(
    SaveLocaleUseCase(
      appPreferenceRepository: Injector.findSingleton(),
    ),
  );

  /// NOTIFIER
  final notifier = AppPreferenceNotifier(
    loadAppPreferenceUseCase: Injector.findSingleton(),
    saveTextScalerUseCase: Injector.findSingleton(),
    saveThemeModeUseCase: Injector.findSingleton(),
    saveLocaleUseCase: Injector.findSingleton(),
  );

  await notifier.initialize();

  Injector.registerSingleton<AppPreferenceNotifier>(
    notifier,
  );
}
