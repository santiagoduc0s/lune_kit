import 'package:get_it/get_it.dart';

/// Injector class to register and retrieve services
class Injector {
  static final GetIt _getIt = GetIt.instance;

  /// Register a class
  static void registerSingleton<T extends Object>(T service) {
    _getIt.registerSingleton<T>(service);
  }

  /// Register a class
  static void registerLazySingleton<T extends Object>(T service) {
    _getIt.registerLazySingleton<T>(() => service);
  }

  /// Get a registered class
  static T findSingleton<T extends Object>() {
    return _getIt<T>();
  }

  /// Reset the classes registered
  static Future<void> reset() {
    return _getIt.reset();
  }
}
