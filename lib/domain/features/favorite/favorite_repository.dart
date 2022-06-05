import 'package:cookbook/domain/features/recipe/recipe_entities.dart';

abstract class FavoriteRepository {
  Future<void> createFavorite(Recipe recipe);
  Future<List<Recipe>> getAllFavorite();
  Future<Recipe> getRecipeByUrl(String url);
  Future<void> deleteFavorite(String url);
}
