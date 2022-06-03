class HtmlElements {
  // in recipe page
  static const String title = "recipe-header__name";
  static const String imgUrl = "content-media";
  static const String time = "entry-stats__value";
  static const String personCount =
      "entry-stats__item entry-stats__item_persons";
  static const String description = "recipe_description";
  static const String ingredientTitle = "recipe_ingredient_title";
  static const String ingredientVolume =
      "definition-list-table__td definition-list-table__td_value";
  static const String stepsTitle = "recipe-step-title";
  static const String stepsField = "step-image-container-posted";
  /* --- */
  // in search page
  static const String pagination = "paginator__item false";
  static const String cardPic = "card__picture";
  static const String cardInfo = "card__description";
}

class WebsiteRoutes {
  static const String baseUrl = "https://www.edimdoma.ru";
  static const String search = "/retsepty?query=";
  static const String userAgent =
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
      "(KHTML, like Gecko) Chrome/98.0.4758.80 Safari/537.36 Edg/98.0.1108.50";
}
