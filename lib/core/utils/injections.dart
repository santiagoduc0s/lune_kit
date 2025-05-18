import 'package:lune/core/utils/utils.dart';

Future<void> utilsInjections() async {
  Injector.registerSingleton(
    Localization(() => AppGlobalKey.getRootContext()!),
  );

  final keyValueStorage = BoxKeyValueLocalStorage();
  await keyValueStorage.initialize();
  Injector.registerSingleton<KeyValueLocalStorage>(keyValueStorage);
}
