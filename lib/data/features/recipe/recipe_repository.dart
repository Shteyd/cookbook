import 'dart:convert';

import 'package:cookbook/data/constants.dart';
import 'package:cookbook/domain/features/recipe/recipe_entities.dart';
import 'package:cookbook/domain/features/recipe/recipe_repository.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class RecipeRepositoryImpl implements RecipeRepository {
  late String _body;

  List<Element> _getElement(String name) =>
      parse(_body).getElementsByClassName(name);

  @override
  Future<Recipe> getRecipe(String url) async {
    final response = await http.get(
      Uri.parse('${WebsiteRoutes.baseUrl}$url'),
      headers: {'user-agent': WebsiteRoutes.userAgent},
    );

    _body = utf8.decode(response.bodyBytes);
    final title = _getElement(HtmlElements.title);
    final img = _getElement(HtmlElements.imgUrl);
    final time = _getElement(HtmlElements.time);
    final ingredientTitle = _getElement(HtmlElements.ingredientTitle);
    final ingredientVolume = _getElement(HtmlElements.ingredientVolume);
    final personCount = _getElement(HtmlElements.personCount);
    final description = _getElement(HtmlElements.description);
    final stepsTitle = _getElement(HtmlElements.stepsTitle);
    final stepsField = _getElement(HtmlElements.stepsField);

    final recipe = Recipe(
      title: title[0].text,
      imgUrl: img[0].children[1].attributes['src'] ?? "",
      time: time[0].text,
      personCount: personCount[0].children[1].text,
      description: description[0].text,
      ingredients: List.generate(
        ingredientTitle.length,
        (index) => RecipeIngredient(
          title: ingredientTitle[index].text,
          volume: ingredientVolume[index].text,
        ),
      ),
      steps: List.generate(stepsTitle.length, (index) {
        final attrs = stepsField[index].firstChild!.attributes;
        return RecipeStep(
          index: stepsTitle[index].children[1].text,
          imgUrl: attrs['src']!,
          description: attrs['title']!,
        );
      }),
    );

    return recipe;
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
