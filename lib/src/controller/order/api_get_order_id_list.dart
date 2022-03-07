import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List<OrderModel>> getOrderIdList(String id) async {

  final ParseCloudFunction function = ParseCloudFunction('get-order-id');
  final Map<String, dynamic> params = <String, dynamic>{
    'orderId': id,
  };

  final ParseResponse parseResponse =
  await function.execute(parameters: params);

  if (parseResponse.success) {
    if (parseResponse.result != null) {

      return List<OrderModel>.from(parseResponse.result.map((e) => OrderModel.fromJson(e)));

    }
  }

  return [];

}