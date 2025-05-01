import 'package:core/core.dart';
import 'package:lune/core/utils/key_value_local_storage.dart';
import 'package:lune/core/utils/localization.dart';

Future<void> utilsInjections() async {
  Injector.registerSingleton(
    Localization(() => AppGlobalKey.getRootContext()!),
  );

  final keyValueStorage = KeyValueLocalStorage();
  await keyValueStorage.initialize();
  Injector.registerSingleton(keyValueStorage);
}
