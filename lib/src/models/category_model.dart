class CategoryModel {
  String id;
  String title;

  CategoryModel({required this.id, required this.title});

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
