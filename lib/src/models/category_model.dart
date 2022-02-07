class CategoryModel {
  CategoryModel({required this.id, required this.title});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];

  String id;
  String title;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
