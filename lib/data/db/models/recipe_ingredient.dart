class DbRecipeIngredient {
  final String title;
  final String volume;

  const DbRecipeIngredient({
    required this.title,
    required this.volume,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'volume': volume,
    };
  }

  factory DbRecipeIngredient.fromMap(Map<String, dynamic> map) {
    return DbRecipeIngredient(
      title: map['title'] as String,
      volume: map['volume'] as String,
    );
  }
}
