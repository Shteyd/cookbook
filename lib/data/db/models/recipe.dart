import 'dart:convert';

import 'package:cookbook/data/db/models/recipe_ingredient.dart';
import 'package:cookbook/data/db/models/recipe_step.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class DbRecipe {
  final String url;
  final String title;
  final String imgUrl;
  final String time;
  final String personCount;
  final String description;
  final List<DbRecipeIngredient> ingredients;
  final List<DbRecipeStep> steps;

  const DbRecipe({
    required this.url,
    required this.title,
    required this.imgUrl,
    required this.time,
    required this.personCount,
    required this.description,
    required this.ingredients,
    required this.steps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'title': title,
      'imgUrl': imgUrl,
      'time': time,
      'personCount': personCount,
      'description': description,
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'steps': steps.map((x) => x.toMap()).toList(),
    };
  }

  factory DbRecipe.fromMap(Map<String, dynamic> map) {
    return DbRecipe(
      url: map['url'] as String,
      title: map['title'] as String,
      imgUrl: map['imgUrl'] as String,
      time: map['time'] as String,
      personCount: map['personCount'] as String,
      description: map['description'] as String,
      ingredients: List<DbRecipeIngredient>.from(
        (map['ingredients'] as List<int>).map<DbRecipeIngredient>(
          (x) => DbRecipeIngredient.fromMap(x as Map<String, dynamic>),
        ),
      ),
      steps: List<DbRecipeStep>.from(
        (map['steps'] as List<int>).map<DbRecipeStep>(
          (x) => DbRecipeStep.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DbRecipe.fromJson(String source) =>
      DbRecipe.fromMap(json.decode(source) as Map<String, dynamic>);
}
