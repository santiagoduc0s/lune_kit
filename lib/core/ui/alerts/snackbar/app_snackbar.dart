import 'package:flutter/material.dart';

/// A singleton class for displaying custom snackbars.
class AppSnackbar {
  AppSnackbar({
    required this.getScaffoldMessenger,
    required this.getContext,
  });

  final ScaffoldMessengerState Function() getScaffoldMessenger;
  final BuildContext Function() getContext;

  /// Shows a snackbar with the given [snackbar] content.
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showSnackBar(
    SnackBar snackbar,
  ) {
    final currentState = getScaffoldMessenger()..hideCurrentSnackBar();

    return currentState.showSnackBar(snackbar);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show({
    required SnackBar Function(BuildContext) snackbar,
  }) {
    return _showSnackBar(snackbar(getContext()));
  }
}
