import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:lune/config/config.dart';
import 'package:lune/core/ui/injections.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/injections.dart';

Future<void> injectModules() async {
  configInjections();
  uiInjections();
  await utilsInjections();
  await featureInjections();
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await injectModules();

  AppLogger.instance.debug(Env.environment);

  /// Expand the time to show more time the splash screen
  await Future.delayed(const Duration(milliseconds: 1000), () {});

  runApp(await builder());
}
