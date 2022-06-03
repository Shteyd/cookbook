import 'dart:convert';

import 'package:cookbook/data/constants.dart';
import 'package:cookbook/domain/features/search/search_entities.dart';
import 'package:cookbook/domain/features/search/search_repository.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class SearchRepositoryImpl implements SearchRepository {
  Future<http.Response> _getRequest(String input) {
    return http.get(
      Uri.parse('${WebsiteRoutes.search}$input'),
      headers: {
        'user-agent': WebsiteRoutes.userAgent,
      },
    );
  }

  @override
  Future<int> pagesCount(String input) async {
    final response = await _getRequest(input);
    final body = utf8.decode(response.bodyBytes);
    final countOfPages =
        parse(body).getElementsByClassName(HtmlElements.pagination);
    final int count = int.parse(countOfPages[countOfPages.length - 1].text);

    return count;
  }

  @override
  Future<List<SearchRecipe>> search(String input) async {
    final List<SearchRecipe> res = [];
    final List<String> images = [];
    final List<String> titles = [];
    final List<String> descriptions = [];
    final List<String> urls = [];

    final response = await _getRequest(input);

    final body = utf8.decode(response.bodyBytes);
    final cardsImage = parse(body).getElementsByClassName(HtmlElements.cardPic);
    final cardsContent =
        parse(body).getElementsByClassName(HtmlElements.cardInfo);

    for (int index = 0; index < cardsContent.length; index++) {
      final content = cardsContent[index].children[0];

      titles.add(content.children[0].text);
      descriptions.add(content.children[1].text);
      urls.add(content.attributes['href']!);
    }

    for (int index = 1; index < cardsImage.length; index++) {
      final attrs = cardsImage[index].children[0].attributes;
      if (attrs['src'] == null) {
        continue;
      }

      images.add(attrs['src']!);
    }

    for (int index = 0; index < cardsContent.length; index++) {
      res.add(
        SearchRecipe(
          title: titles[index],
          description: descriptions[index],
          imgUrl: images[index],
          url: urls[index],
        ),
      );
    }

    return res;
  }
}
