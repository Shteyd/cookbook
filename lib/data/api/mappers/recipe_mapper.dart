import 'package:cookbook/data/api/mappers/recipe_ingredient_mapper.dart';
import 'package:cookbook/data/api/mappers/recipe_step_mapper.dart';
import 'package:cookbook/data/constants.dart';
import 'package:cookbook/domain/features/recipe/recipe_entities.dart';
import 'package:html/parser.dart';

extension RecipeMapper on Recipe {
  static Recipe fromHtml(String body) {
    return Recipe(
      url: "",
      title: parse(body).getElementsByClassName(HtmlElements.title)[0].text,
      imgUrl: parse(body)
          .getElementsByClassName(HtmlElements.imgUrl)[0]
          .children[1]
          .attributes['src']!,
      time: parse(body).getElementsByClassName(HtmlElements.time)[0].text,
      personCount: parse(body)
          .getElementsByClassName(HtmlElements.personCount)[0]
          .children[1]
          .text,
      description:
          parse(body).getElementsByClassName(HtmlElements.description)[0].text,
      ingredients: List.generate(
        parse(body).getElementsByClassName(HtmlElements.ingredientTitle).length,
        (index) => RecipeIngredient(
          title: parse(body)
              .getElementsByClassName(HtmlElements.ingredientTitle)[index]
              .text,
          volume: parse(body)
              .getElementsByClassName(HtmlElements.ingredientVolume)[index]
              .text,
        ),
      ),
      steps: List.generate(
        parse(body).getElementsByClassName(HtmlElements.stepsTitle).length,
        (index) => RecipeStep(
          index: parse(body)
              .getElementsByClassName(HtmlElements.stepsTitle)[index]
              .children[1]
              .text,
          imgUrl: parse(body)
              .getElementsByClassName(HtmlElements.stepsField)[index]
              .firstChild!
              .attributes['src']!,
          description: parse(body)
              .getElementsByClassName(HtmlElements.stepsField)[index]
              .firstChild!
              .attributes['title']!,
        ),
      ),
    );
  }

  static Map<String, dynamic> toMap(Recipe r) {
    return <String, dynamic>{
      'url': r.url,
      'title': r.title,
      'imgUrl': r.imgUrl,
      'time': r.time,
      'personCount': r.personCount,
      'description': r.description,
      'ingredients':
          r.ingredients.map((x) => RecipeIngredientMapper.toMap(x)).toList(),
      'steps': r.steps.map((x) => RecipeStepMapper.toMap(x)).toList(),
    };
  }

  static Recipe fromMap(Map<String, dynamic> map) {
    return Recipe(
      url: map['url'] as String,
      title: map['title'] as String,
      imgUrl: map['imgUrl'] as String,
      time: map['time'] as String,
      personCount: map['personCount'] as String,
      description: map['description'] as String,
      ingredients: List<RecipeIngredient>.from(
        (map['ingredients'] as List<int>).map<RecipeIngredient>(
          (x) => RecipeIngredientMapper.fromMap(x as Map<String, dynamic>),
        ),
      ),
      steps: List<RecipeStep>.from(
        (map['steps'] as List<int>).map<RecipeStep>(
          (x) => RecipeStepMapper.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
