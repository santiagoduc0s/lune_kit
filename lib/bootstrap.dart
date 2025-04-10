import 'dart:async';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  Logger().d(Env.environment);

  await KeyValueStorage.instance.initialize();

  AppPreference.instance.initialize();

  /// Expand the time of the native splash screen
  await Future.delayed(const Duration(milliseconds: 1000), () {});

  runApp(await builder());

  FlutterNativeSplash.remove();
}
