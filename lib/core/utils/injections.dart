import 'package:lune/core/utils/utils.dart';

Future<void> utilsInjections() async {
  Injector.registerSingleton(
    Localization(() => AppGlobalKey.getRootContext()!),
  );

  final keyValueStorage = KeyValueLocalStorage();
  await keyValueStorage.initialize();
  Injector.registerSingleton(keyValueStorage);
}
