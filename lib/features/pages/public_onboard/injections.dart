import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/pages/public_onboard/data/datasources/datasources.dart';
import 'package:lune/features/pages/public_onboard/data/repositories/repositories.dart';
import 'package:lune/features/pages/public_onboard/domain/repositories/repositories.dart';
import 'package:lune/features/pages/public_onboard/domain/usecases/usecases.dart';
import 'package:lune/features/pages/public_onboard/ui/notifiers/notifiers.dart';

Future<void> publicOnboardInjections() async {
  /// DATASOURCE
  Injector.registerSingleton<PublicOnboardDatasource>(
    PublicOnboardLocalDatasource(
      Injector.findSingleton(),
    ),
  );

  /// REPOSITORY
  Injector.registerSingleton<PublicOnboardRepository>(
    PublicOnboardRepositoryImpl(
      Injector.findSingleton(),
    ),
  );

  /// USE CASES
  Injector.registerSingleton<SetPublicOnboardStatusUseCase>(
    SetPublicOnboardStatusUseCase(
      Injector.findSingleton(),
    ),
  );

  Injector.registerSingleton<GetPublicOnboardStatusUseCase>(
    GetPublicOnboardStatusUseCase(
      Injector.findSingleton(),
    ),
  );

  /// NOTIFIER
  final notifier = PublicOnboardNotifier(
    getStatusUseCase: Injector.findSingleton(),
    setStatusUseCase: Injector.findSingleton(),
    router: Injector.findSingleton(),
    snackbar: Injector.findSingleton(),
    localization: Injector.findSingleton(),
  );

  await notifier.initialize();

  Injector.registerSingleton<PublicOnboardNotifier>(
    notifier,
  );
}
