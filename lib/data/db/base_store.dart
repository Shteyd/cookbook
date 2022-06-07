import 'package:hive/hive.dart';

abstract class BaseStore<T> {
  String get key;
  String get boxId;
  T get defaultValue;
  late final T userValue;

  Future<void> load() async {
    final isExist = await Hive.boxExists(boxId);
    if (!isExist == true) {
      userValue = await _createStoreWithDefault();
    }

    final box = await Hive.openBox(boxId);
    final res = await box.get(key);
    await box.close();

    userValue = res;
  }

  Future<void> update(T value) async {
    final box = await Hive.openBox(boxId);
    await box.put(key, value);
    await box.close();

    userValue = value;
  }

  Future<T> _createStoreWithDefault() async {
    final box = await Hive.openBox(boxId);
    await box.put(key, defaultValue);
    await box.close();

    return defaultValue;
  }
}
