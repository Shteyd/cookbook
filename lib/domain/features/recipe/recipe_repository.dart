import 'package:cookbook/domain/features/recipe/recipe_entities.dart';

abstract class RecipeRepository {
  Future<Recipe> getRecipe(String url);

  Future<void> getAllRecipes();
  Future<void> saveRecipe();
  Future<void> deleteRecipe();
}
