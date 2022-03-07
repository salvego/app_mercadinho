import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List<OrderModel>> getOrderList() async {

  final ParseCloudFunction function = ParseCloudFunction('get-orders');
  final ParseResponse parseResponse = await function.execute();

  if (parseResponse.success) {
    if (parseResponse.result != null) {

      return List<OrderModel>.from(parseResponse.result.map((e) => OrderModel.fromJson(e)));

    }
  }

  return [];

}