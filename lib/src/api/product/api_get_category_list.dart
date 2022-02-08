import 'dart:convert';

import 'package:app_mercadinho/src/models/category_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List> getCategoryList() async {

  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  // for (var item in parseResponse.result) {
  //   category.add(item['title']);
  // }

  if (parseResponse.success) {
    if (parseResponse.result != null) {

      return parseResponse.result.map((e) => CategoryModel.fromJson(e).title).toList();

    }
  }

  return [];

}
