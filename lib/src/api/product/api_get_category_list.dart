import 'dart:convert';

import 'package:app_mercadinho/src/models/category_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List<CategoryModel>> getCategoryList() async {

  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  // for (var item in parseResponse.result) {
  //   category.add(item['title']);
  // }

  //return category[index];

  final List jsonDecoded = json.decode(parseResponse.result) as List;

  return jsonDecoded.map((e) => CategoryModel.fromJson(e)).toList();

  
}
