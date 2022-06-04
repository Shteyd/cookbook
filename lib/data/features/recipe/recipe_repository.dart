import 'dart:convert';

import 'package:cookbook/data/api/mappers/recipe_mapper.dart';
import 'package:cookbook/data/api/uri_resolver.dart';
import 'package:cookbook/data/constants.dart';
import 'package:cookbook/domain/features/recipe/recipe_entities.dart';
import 'package:cookbook/domain/features/recipe/recipe_repository.dart';
import 'package:http/http.dart' as http;

class RecipeRepositoryImpl implements RecipeRepository {
  const RecipeRepositoryImpl({
    required this.uriResolver,
    required this.client,
  });

  final UriResolver uriResolver;
  final http.Client client;

  @override
  Future<Recipe> getRecipe(String url) async {
    final response = await client.get(
      uriResolver.uri(url),
      headers: {'user-agent': userAgent},
    );
    final body = utf8.decode(response.bodyBytes);

    return RecipeMapper.fromHtml(body);
  }

  @override
  Future<void> deleteRecipe() {
    // TODO: implement deleteRecipe
    throw UnimplementedError();
  }

  @override
  Future<void> getAllRecipes() {
    // TODO: implement getAllRecipes
    throw UnimplementedError();
  }

  @override
  Future<void> saveRecipe() {
    // TODO: implement saveRecipe
    throw UnimplementedError();
  }
}
