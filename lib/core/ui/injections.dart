import 'package:lune/core/ui/alerts/alerts.dart';
import 'package:lune/core/utils/utils.dart';

void uiInjections() {
  /// ALERT
  Injector.registerSingleton(
    AppDialog(() => AppGlobalKey.getRootContext()!),
  );

  /// SNACKBAR
  Injector.registerSingleton<CustomSnackbar>(
    AppSnackbar(
      getScaffoldMessenger: () => AppGlobalKey.scaffoldMessengerState()!,
    ),
  );
}
