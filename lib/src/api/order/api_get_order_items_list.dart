import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List<CartItemModel>> getOrderItemsList(String orderId) async {

  final ParseCloudFunction function = ParseCloudFunction('get-order-items');
  final Map<String, dynamic> params = <String, dynamic>{
    'orderId': orderId,
  };

  final ParseResponse parseResponse =
  await function.execute(parameters: params);

  if (parseResponse.success) {
    if (parseResponse.result != null) {

      return List<CartItemModel>.from(parseResponse.result.map((e) => CartItemModel.fromJson(e)));

    }
  }

  return [];

}