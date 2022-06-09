import 'package:cookbook/presentation/screens/favorite_screen.dart';
import 'package:cookbook/presentation/screens/get_started_screen.dart';
import 'package:cookbook/presentation/screens/home_screen.dart';
import 'package:cookbook/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String getStarted = "/get-started";
  static const String home = "/";
  static const String favorite = "/favorite";
  static const String search = "/search";

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
      default:
        throw const FormatException('Route not found!');
    }
  }
}
