import 'package:hive_flutter/hive_flutter.dart';

abstract class IBaseCacheService<T> {
  final String key;
  Box<T>? _box;

  Box<T>? get box => _box;

  IBaseCacheService(this.key);

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  void registerAdapters();

  Future<void> clearAll() async {
    await _box?.clear();
  }

  Future<void> addItems(List<T> items) async {
    await _box?.addAll(items);
  }

  Future<void> putItems(List<T> items);

  T? getItem(String key) {
    return _box?.get(key);
  }

  List<T>? getValues() {
    return _box?.values.toList();
  }

  Future<void> putItem(String key, T item) async {
    await _box?.put(key, item);
  }

  Future<void> removeItem(String key) async {
    await _box?.delete(key);
  }
}
