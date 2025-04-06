import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  await Future.delayed(const Duration(milliseconds: 1000), () {});

  runApp(await builder());

  FlutterNativeSplash.remove();
}
