class ItemModel {
  String id;
  String title;
  String picture;
  String unit;
  double price;
  String description;

  ItemModel({
    required this.id,
    required this.description,
    required this.picture,
    required this.title,
    required this.price,
    required this.unit,
  });

  ItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        picture = json['picture'],
        unit = json['unit'],
        price = json['price'].toDouble(),
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'unit': unit,
      'price': price,
      'description': description,
    };
  }
}
