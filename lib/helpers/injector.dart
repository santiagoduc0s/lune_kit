import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static final GetIt _getIt = GetIt.instance;

  static void register<T extends Object>(T service) {
    _getIt.registerSingleton<T>(service);
  }

  static T get<T>() {
    return _getIt<T>();
  }

  static Future<void> reset() async {
    await _getIt.reset();
  }
}
