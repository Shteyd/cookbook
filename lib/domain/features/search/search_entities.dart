// TODO: нормальная модель, для поиска
// с учетом пагинации

class SearchRecipe {
  final String title;
  final String description;
  final String imgUrl;
  final String url;

  SearchRecipe({
    required this.title,
    required this.description,
    required this.imgUrl,
    required this.url,
  });
}
