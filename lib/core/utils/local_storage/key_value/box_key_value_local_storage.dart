import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:lune/core/utils/local_storage/key_value/key_value.dart';
import 'package:path_provider/path_provider.dart';

class BoxKeyValueLocalStorage extends KeyValueLocalStorage {
  static const _boxName = 'box';
  late final Box<dynamic> _box;

  @override
  Future<void> initialize() async {
    if (kIsWeb) {
      Hive.init('');
    } else {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }

    _box = await Hive.openBox(_boxName);
  }

  @override
  Future<void> save<T>(String key, T value) async {
    await _box.put(key, value);
  }

  @override
  T? get<T>(String key, {T? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue) as T?;
  }

  @override
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> clearData() async {
    await _box.clear();
  }
}
