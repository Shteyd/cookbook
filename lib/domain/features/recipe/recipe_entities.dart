// ignore_for_file: public_member_api_docs, sort_constructors_first

class Recipe {
  final String url;
  final String title;
  final String imgUrl;
  final String time;
  final String personCount;
  final String description;
  final List<RecipeIngredient> ingredients;
  final List<RecipeStep> steps;

  const Recipe({
    required this.url,
    required this.title,
    required this.imgUrl,
    required this.time,
    required this.personCount,
    required this.description,
    required this.ingredients,
    required this.steps,
  });
}

class RecipeIngredient {
  final String title;
  final String volume;

  const RecipeIngredient({
    required this.title,
    required this.volume,
  });
}

class RecipeStep {
  final String index;
  final String imgUrl;
  final String description;

  const RecipeStep({
    required this.index,
    required this.imgUrl,
    required this.description,
  });
}
