import 'dart:convert';

import 'package:cookbook/data/db/models/recipe.dart';
import 'package:hive/hive.dart';

abstract class FavoriteStore {
  static const boxId = "favorite";

  Future<void> create(DbRecipe recipe) async {
    final box = await Hive.openLazyBox(boxId);

    await box.put(recipe.url, jsonDecode(recipe.toJson()));
    await box.close();
  }

  Future<void> delete(String url) async {
    final box = await Hive.openLazyBox(boxId);

    await box.delete(url);
    await box.close();
  }

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

  Future<DbRecipe> read(String url) async {
    final box = await Hive.openLazyBox(boxId);
    final res = await box.get(url);
    await box.close();

    return DbRecipe.fromJson(jsonDecode(res));
  }
}
