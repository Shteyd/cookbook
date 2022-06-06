import 'dart:convert';

import 'package:cookbook/data/db/base_store.dart';
import 'package:cookbook/data/db/models/recipe.dart';
import 'package:hive/hive.dart';

class FavoriteStore extends BaseStore<DbRecipe> {
  @override
  String get boxId => "favorites";

  @override
  Future<void> create(value) async {
    final box = await Hive.openLazyBox(boxId);

    await box.put(value.url, jsonDecode(value.toJson()));
    await box.close();
  }

  @override
  Future<void> delete(String key) async {
    final box = await Hive.openLazyBox(boxId);

    await box.delete(key);
    await box.close();
  }

  @override
  Future<DbRecipe> read(String key) async {
    final box = await Hive.openLazyBox(boxId);
    final res = await box.get(key);
    await box.close();

    return DbRecipe.fromJson(jsonDecode(res));
  }

  @override
  Future<List<DbRecipe>> readAll() async {
    final List<DbRecipe> res = [];

    final box = await Hive.openLazyBox(boxId);
    final keys = box.keys;
    for (final String key in keys) {
      final element = await box.get(key);
      res.add(DbRecipe.fromJson(jsonDecode(element)));
    }
    await box.close();

    return res;
  }
}
