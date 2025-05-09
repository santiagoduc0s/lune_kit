import 'package:flutter/material.dart';

/// A service for displaying custom dialogs in a Flutter application.
/// Use dependency injection to provide BuildContext or override in tests.
class AppDialog {
  const AppDialog(this.getContext);

  /// A function that returns the current [BuildContext].
  /// Allows injecting context in tests or different parts of the widget tree.
  final BuildContext Function() getContext;

  /// Shows a dialog to confirm an action, returning `true` if confirmed.
  Future<bool> confirm(
    AlertDialog Function(BuildContext) dialog, {
    bool barrierDismissible = false,
    BuildContext? context,
  }) async {
    final result = await show<bool>(
      dialog,
      barrierDismissible: barrierDismissible,
      context: context,
    );
    return result != null && result == true;
  }

  /// Shows a generic dialog and returns a value of type [T].
  Future<T?> show<T>(
    AlertDialog Function(BuildContext) dialog, {
    bool barrierDismissible = false,
    BuildContext? context,
  }) {
    final ctx = context ?? getContext();

    if (!ctx.mounted) {
      throw Exception('Dialog context is not mounted');
    }

    return showDialog<T>(
      context: ctx,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return dialog(context);
      },
    );
  }
}
