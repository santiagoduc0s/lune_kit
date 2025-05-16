import 'package:flutter/material.dart';
import 'package:lune/core/ui/alerts/dialog/dialog.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';

extension ChangeNotifierX on ChangeNotifier {
  void logError(
    Object error, [
    StackTrace? stackTrace,
  ]) {
    AppLogger.instance.error(error.toString(), stackTrace: stackTrace);
  }

  void logDebug(
    Object message, [
    StackTrace? stackTrace,
  ]) {
    AppLogger.instance.debug(message.toString(), stackTrace: stackTrace);
  }

  void primarySnackbar(CustomSnackbar snackbar, String text) {
    snackbar.show(
      (context) => Snackbars.error(
        context,
        text: text,
      ),
    );
  }

  void errorSnackbar(CustomSnackbar snackbar, String text) {
    snackbar.show(
      (context) => Snackbars.error(
        context,
        text: text,
      ),
    );
  }

  Future<bool> dialogConfirm(
    AppDialog dialog, {
    required String message,
    required String confirmText,
    required String cancelText,
  }) {
    return dialog.confirm(
      (context) => Dialogs.confirm(
        context,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
      ),
    );
  }

  Future<void> dialogInfo(
    AppDialog dialog, {
    required String message,
    required String confirmText,
  }) {
    return dialog.confirm(
      (context) => Dialogs.info(
        context,
        message: message,
        confirmText: confirmText,
      ),
    );
  }
}
