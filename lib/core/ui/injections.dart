import 'package:core/core.dart';
import 'package:lune/core/ui/alerts/alerts.dart';

void uiInjections() {
  /// ALERT
  Injector.registerSingleton(
    AppDialog(() => AppGlobalKey.getRootContext()!),
  );

  /// SNACKBAR
  Injector.registerSingleton(
    AppSnackbar(
      getScaffoldMessenger: () => AppGlobalKey.scaffoldMessengerState()!,
      getContext: () => AppGlobalKey.getRootContext()!,
    ),
  );
}
