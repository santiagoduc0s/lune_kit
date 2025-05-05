import 'package:logger/logger.dart';

enum LogLevel {
  debug,
  info,
  warning,
  error;
}

class AppLogger {
  AppLogger._singleton();

  static final AppLogger instance = AppLogger._singleton();

  final logger = Logger();

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
    }
  }

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
