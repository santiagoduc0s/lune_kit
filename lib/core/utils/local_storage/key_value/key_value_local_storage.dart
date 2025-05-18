abstract class KeyValueLocalStorage {
  Future<void> initialize();

  Future<void> save<T>(String key, T value);

  T? get<T>(String key, {T? defaultValue});

  Future<void> remove(String key);

  /// Clears all data.
  Future<void> clearData();
}
