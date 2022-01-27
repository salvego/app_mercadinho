
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


List<String> myList = [];

 void getCategoryList2() async {
  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  if (parseResponse.success && parseResponse.result != null) {
    print(parseResponse.result[0]['title']);
  }

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


