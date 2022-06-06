import 'package:cookbook/domain/features/recipe/recipe_entities.dart';

extension RecipeStepMapper on RecipeStep {
  static Map<String, dynamic> toMap(RecipeStep rs) {
    return <String, dynamic>{
      'index': rs.index,
      'imgUrl': rs.imgUrl,
      'description': rs.description,
    };
  }

  static RecipeStep fromMap(Map<String, dynamic> map) {
    return RecipeStep(
      index: map['index'],
      imgUrl: map['imgUrl'],
      description: map['description'],
    );
  }
}
