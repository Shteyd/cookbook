import 'package:cookbook/domain/features/recipe/recipe_entities.dart';

extension RecipeIngredientMapper on RecipeIngredient {
  static Map<String, dynamic> toMap(RecipeIngredient ri) {
    return <String, dynamic>{
      'title': ri.title,
      'volume': ri.volume,
    };
  }

  static RecipeIngredient fromMap(Map<String, dynamic> map) {
    return RecipeIngredient(
      title: map['title'] as String,
      volume: map['volume'] as String,
    );
  }
}
