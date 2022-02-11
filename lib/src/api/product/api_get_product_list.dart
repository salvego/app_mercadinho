import 'package:app_mercadinho/src/models/item_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List> getProductList() async {
  final ParseCloudFunction function = ParseCloudFunction('get-product-list');
  final ParseResponse parseResponse = await function.execute();

  if (parseResponse.success) {
    if (parseResponse.result != null) {

       return parseResponse.result
           .map((e) => ItemModel.fromJson(e))
           .toList();
    }
  }

  return [];
}
