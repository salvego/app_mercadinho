
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Category {
  const Category(this.name);

  final String name;
}


List<Category> categorys = [
];


Future<String?> getCategoryList2() async {
  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  return parseResponse.result as String;
}





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


