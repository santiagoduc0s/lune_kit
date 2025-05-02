import 'package:core/core.dart';
import 'package:flutter/material.dart';

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
}
