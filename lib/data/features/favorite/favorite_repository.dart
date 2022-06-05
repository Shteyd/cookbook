import 'package:cookbook/domain/features/favorite/favorite_repository.dart';
import 'package:cookbook/domain/features/recipe/recipe_entities.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  @override
  Future<void> createFavorite(Recipe recipe) {
    // TODO: implement createFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFavorite(String url) {
    // TODO: implement deleteFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<Recipe>> getAllFavorite() {
    // TODO: implement getAllFavorite
    throw UnimplementedError();
  }

  @override
  Future<Recipe> getRecipeByUrl(String url) {
    // TODO: implement getRecipeByUrl
    throw UnimplementedError();
  }
}
