import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/app_preference/app_preference.dart';

Future<void> injectModules() async {
  await utilsInjections();
  await appPreferenceInjections();
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  await injectModules();

  AppLogger.instance.debug(Env.environment);

  /// Expand the time of the native splash screen
  await Future.delayed(const Duration(milliseconds: 1000), () {});

  runApp(await builder());

  FlutterNativeSplash.remove();
}
