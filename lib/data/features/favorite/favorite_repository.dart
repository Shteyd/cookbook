import 'package:cookbook/data/api/mappers/recipe_mapper.dart';
import 'package:cookbook/data/db/favorite_store.dart';
import 'package:cookbook/data/db/models/recipe.dart';
import 'package:cookbook/domain/features/favorite/favorite_repository.dart';
import 'package:cookbook/domain/features/recipe/recipe_entities.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  const FavoriteRepositoryImpl({required this.store});

  final FavoriteStore store;

  @override
  Future<void> createFavorite(Recipe recipe) async {
    await store.createFavorite(DbRecipe.fromMap(RecipeMapper.toMap(recipe)));
  }

  @override
  Future<void> deleteFavorite(String url) async {
    await store.deleteFavorite(url);
  }

  @override
  Future<List<Recipe>> getAllFavorite() async {
    final List<DbRecipe> recipes = await store.getAllRecipes();
    final List<Recipe> res = List.generate(
      recipes.length,
      (index) => RecipeMapper.fromMap(recipes[index].toMap()),
    );

    return res;
  }

  @override
  Future<Recipe> getRecipeByUrl(String url) async {
    final DbRecipe recipe = await store.getRecipe(url);
    final res = RecipeMapper.fromMap(recipe.toMap());

    return res;
  }
}
