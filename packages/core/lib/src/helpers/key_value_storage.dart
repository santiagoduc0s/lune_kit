import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// A singleton class that provides key-value storage using Hive.
class KeyValueStorage {
  KeyValueStorage._singleton();

  /// Singleton instance of [KeyValueStorage].
  static final KeyValueStorage instance = KeyValueStorage._singleton();

  static const _boxName = 'box';
  late final Box<dynamic> _box;

  /// Initializes the storage.
  Future<void> initialize() async {
    if (kIsWeb) {
      Hive.init('');
    } else {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
    }

    _box = await Hive.openBox(_boxName);
  }

  /// Saves a [value] of type [T] with the given [key].
  Future<void> save<T>(String key, T value) async {
    await _box.put(key, value);
  }

  /// Retrieves the data associated with the given [key].
  T? get<T>(String key) {
    return _box.get(key) as T?;
  }

  /// Remove the data associated with the given [key].
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  /// Clears all data.
  Future<void> clearData() async {
    await _box.clear();
  }
}
