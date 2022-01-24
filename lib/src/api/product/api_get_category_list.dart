
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void getCategoryList() async {

  int i = 0;

  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  List<String> category = [];

  category.addAll(parseResponse.result as List<String>);

  print(category);

}
