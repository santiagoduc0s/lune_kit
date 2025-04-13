import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Enum representing different log levels.
enum LogLevel {
  /// debug
  debug,

  /// info
  info,

  /// warning
  warning,

  /// error
  error;
}

/// Logger class to handle logging messages with different levels.
class AppLogger {
  AppLogger._singleton();

  /// Singleton instance of the logger.
  static final AppLogger instance = AppLogger._singleton();

  /// Logger instance from the logger package.
  final logger = Logger();

  /// Logs a message with the specified log level.
  Future<void> log(
    String message, {
    required LogLevel level,
    StackTrace? stackTrace,
    Map<String, Object> metadata = const {},
  }) async {
    switch (level) {
      case LogLevel.debug:
        logger.d(message, stackTrace: stackTrace);
      case LogLevel.info:
        logger.i(message, stackTrace: stackTrace);
      case LogLevel.warning:
        logger.w(message, stackTrace: stackTrace);
      case LogLevel.error:
        logger.e(message, stackTrace: stackTrace);

        if (kDebugMode) {
          throw Exception(message);
        }
    }
  }

  /// Debug log method.
  void debug(
    String message, {
    StackTrace? stackTrace,
    Map<String, Object> metadata = const {},
  }) =>
      log(
        message,
        level: LogLevel.debug,
        stackTrace: stackTrace,
        metadata: metadata,
      );

  /// Info log method.
  void info(
    String message, {
    StackTrace? stackTrace,
    Map<String, Object> metadata = const {},
  }) =>
      log(
        message,
        level: LogLevel.info,
        stackTrace: stackTrace,
        metadata: metadata,
      );

  /// Warning log method.
  void warning(
    String message, {
    StackTrace? stackTrace,
    Map<String, Object> metadata = const {},
  }) =>
      log(
        message,
        level: LogLevel.warning,
        stackTrace: stackTrace,
        metadata: metadata,
      );

  /// Error log method.
  void error(
    String message, {
    StackTrace? stackTrace,
    Map<String, Object> metadata = const {},
  }) =>
      log(
        message,
        level: LogLevel.error,
        stackTrace: stackTrace,
        metadata: metadata,
      );
}
