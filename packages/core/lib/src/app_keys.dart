import 'package:flutter/material.dart';

/// A singleton class that holds global keys for the application.
class AppKeys {
  AppKeys._singleton();

  /// Singleton instance of [AppKeys].
  static final AppKeys instance = AppKeys._singleton();

  /// Global key for the root navigator.
  GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Global key for the main navigator.
  GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// Global key for the main navigator.
  BuildContext? getRootContext() {
    return rootNavigatorKey.currentContext;
  }
}
