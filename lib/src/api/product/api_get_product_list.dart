import 'package:app_mercadinho/src/models/item_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List> getProductList({int? page, int? itemsPerPage, String? categoryId}) async {
  final ParseCloudFunction function = ParseCloudFunction('get-product-list');

  final Map<String, dynamic> params = <String, dynamic>{
    'page': page,
    'itemsPerPage': itemsPerPage,
    'categoryId': categoryId
  };

  final ParseResponse parseResponse =
      await function.execute(parameters: params);

  if (parseResponse.success) {
    if (parseResponse.result != null) {

       return parseResponse.result
           .map((e) => ItemModel.fromJson(e))
           .toList();
    }
  }

  return [];
}
