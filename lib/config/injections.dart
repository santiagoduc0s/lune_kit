import 'package:lune/config/router/router.dart';
import 'package:lune/core/utils/utils.dart';

void configInjections() {
  /// ROUTER
  Injector.registerSingleton<AppRouter>(AppRouter());
}
