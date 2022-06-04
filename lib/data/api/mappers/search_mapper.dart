import 'package:cookbook/data/constants.dart';
import 'package:cookbook/domain/features/search/search_entities.dart';
import 'package:html/parser.dart';

extension PageCountMapper on int {
  static int fromHtml(String body) {
    final pages = parse(body).getElementsByClassName(HtmlElements.pagination);
    return int.parse(pages[pages.length - 1].text);
  }
}

extension SearchRecipeMapper on SearchRecipe {
  static List<SearchRecipe> fromHtml(String body) {
    final List<String> images = [];
    final List<String> titles = [];
    final List<String> descriptions = [];
    final List<String> urls = [];
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

    return List.generate(
      cardsContent.length,
      (index) => SearchRecipe(
        title: titles[index],
        description: descriptions[index],
        imgUrl: images[index],
        url: urls[index],
      ),
    );
  }
}
