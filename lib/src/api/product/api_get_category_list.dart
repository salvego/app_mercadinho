
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Lista  {

  static Future lista() async{

    final ParseCloudFunction function = ParseCloudFunction('get-category-list');
    final ParseResponse parseResponse = await function.execute();

    if (parseResponse.success && parseResponse.result != null) {
      return parseResponse.result[0]['title'];
    }
    else{
      return [];
    }
  }


}

class Category {
  const Category(this.name);

  final String name;
}

List<Category> categorys = [
  Category('A'),
  Category('B'),
  Category('C'),
];

final List<String> categorysNames = categorys.map((category) => category.name).toList();

/* List<String> myList = [];

List<String> getCategoryList2() async {
  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  if (parseResponse.success && parseResponse.result != null) {
    return parseResponse.result[0]['title'];
  }
  else{
    return [];
  }

} */

/*void getCategoryList() async {

  List<String> category = [];

  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  for(var item in parseResponse.result ) {

    category.add(item['title']);

  }

  category;

}*/

//List<String> Lista = [
//  getCategoryList
//]




//final List<String> category = getCategoryList as List<String>;
//final List<String> category = List<String>.from(getCategoryList as List<String>);


