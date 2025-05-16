import 'package:flutter/material.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';

class AppSnackbar extends CustomSnackbar {
  AppSnackbar({
    required this.getScaffoldMessenger,
  });

  final ScaffoldMessengerState Function() getScaffoldMessenger;

  /// Shows a snackbar with the given [snackbar] content.
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showSnackBar(
    SnackBar snackbar,
  ) {
    final currentState = getScaffoldMessenger()..hideCurrentSnackBar();

    return currentState.showSnackBar(snackbar);
  }

  @override
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
    SnackBar snackbar,
  ) {
    return _showSnackBar(snackbar);
  }
}
