import 'package:flutter/material.dart';

/// Class that holds global keys for the application.
class AppGlobalKey {
  /// Global key for the root navigator.
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  /// Global key for the main navigator.
  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  /// Global key for the main navigator.
  static BuildContext? getRootContext() {
    return rootNavigatorKey.currentContext;
  }
}
