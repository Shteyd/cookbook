import 'package:cookbook/domain/features/search/search_entities.dart';

abstract class SearchRepository {
  Future<int> pagesCount(String input);
  Future<List<SearchRecipe>> search(String input);
}
