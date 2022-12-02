class RecipesModel {
  late String publisher;
  // late String source_url;
  late String title;
  late String image;
  late String id;

  RecipesModel(
      {required this.publisher,
      required this.image,
      // required this.source_url,
      required this.title,
      required this.id});

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
        publisher: json["publisher"],
        image: json["image_url"],
        // source_url: json["source_url"],
        id: json["id"],
        title: json["title"]);
  }
}

class RecipeModel {
  late String publisher;
  late List ingredients;
  late String title;
  late String image;
  late String id;
  late String sourceUrl;

  RecipeModel(
      {required this.publisher,
      required this.image,
      required this.ingredients,
      required this.title,
      required this.sourceUrl,
      required this.id});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
        publisher: json["publisher"],
        image: json["image_url"],
        ingredients: json["ingredients"],
        id: json["id"],
        sourceUrl: json["source_url"],
        title: json["title"]);
  }
}

class IngredientsModel {
  late double quantity;
  late String unit;
  late String description;

  IngredientsModel(
      {required this.quantity, required this.unit, required this.description});

  factory IngredientsModel.fromJson(Map<String, dynamic> json) {
    return IngredientsModel(
        quantity: json['quantity'],
        unit: json['unit'],
        description: json['description']);
  }
}
