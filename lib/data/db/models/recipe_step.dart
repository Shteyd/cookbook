class DbRecipeStep {
  final String index;
  final String imgUrl;
  final String description;

  const DbRecipeStep({
    required this.index,
    required this.imgUrl,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'imgUrl': imgUrl,
      'description': description,
    };
  }

  factory DbRecipeStep.fromMap(Map<String, dynamic> map) {
    return DbRecipeStep(
      index: map['index'] as String,
      imgUrl: map['imgUrl'] as String,
      description: map['description'] as String,
    );
  }
}
