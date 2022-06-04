import 'package:cookbook/data/constants.dart';
import 'package:cookbook/domain/features/recipe/recipe_entities.dart';
import 'package:html/parser.dart';

extension RecipeMapper on Recipe {
  static Recipe fromHtml(String body) {
    return Recipe(
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
}
