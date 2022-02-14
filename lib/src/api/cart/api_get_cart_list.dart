import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List> getCartItemsList() async {

  final ParseCloudFunction function = ParseCloudFunction('get-cart-items');
  final ParseResponse parseResponse = await function.execute();

  if (parseResponse.success) {
    if (parseResponse.result != null) {

      print(parseResponse.result);

      return parseResponse.result.map((e) => CartItemModel.fromJson(e)).toList();

    }
  }

  return [];

}