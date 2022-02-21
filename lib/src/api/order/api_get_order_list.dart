import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List> getOrderList() async {

  final ParseCloudFunction function = ParseCloudFunction('get-category-list');
  final ParseResponse parseResponse = await function.execute();

  if (parseResponse.success) {
    if (parseResponse.result != null) {

      return parseResponse.result.map((e) => OrderModel.fromJson(e)).toList();

    }
  }

  return [];

}