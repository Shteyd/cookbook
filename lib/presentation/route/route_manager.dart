import 'package:cookbook/presentation/screens/favorite_screen.dart';
import 'package:cookbook/presentation/screens/get_started_screen.dart';
import 'package:cookbook/presentation/screens/home_screen.dart';
import 'package:cookbook/presentation/screens/new_recipes_screen.dart';
import 'package:cookbook/presentation/screens/recipe_screen.dart';
import 'package:cookbook/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String getStarted = "/get-started";
  static const String home = "/";
  static const String favorite = "/favorite";
  static const String search = "/search";
  static const String all = "/all";
  static const String recipe = "/recipe";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStarted:
        return MaterialPageRoute(
          builder: (context) => const GetStartedScreen(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case favorite:
        return MaterialPageRoute(
          builder: (context) => const FavoriteScreen(),
        );
      case search:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      case all:
        return MaterialPageRoute(
          builder: (context) => const NewRecipesScreen(),
        );
      case recipe:
        return MaterialPageRoute(
          builder: (context) => const RecipeScreen(),
        );
      default:
        throw const FormatException('Route not found!');
    }
  }
}
