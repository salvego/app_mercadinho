
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void getCategoryList() async {

  List<String> category = [];

  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  for(var item in parseResponse.result ) {

    category.add(item['title']);

  }

  return print(category);

}
