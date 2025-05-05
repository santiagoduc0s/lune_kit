import 'package:flutter/material.dart';

class AppGlobalKey {
  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static BuildContext? getRootContext() {
    return rootNavigatorKey.currentContext;
  }

  static ScaffoldMessengerState? scaffoldMessengerState() {
    return scaffoldMessengerKey.currentState;
  }
}
