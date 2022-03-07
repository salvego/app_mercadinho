import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void newItemCartList(
    double quantity, String productId, BuildContext context) async {
  final ParseCloudFunction function = ParseCloudFunction('add-item-to-cart');
  final Map<String, dynamic> params = <String, dynamic>{
    'quantity': quantity,
    'productId': productId,
  };

  final ParseResponse parseResponse =
      await function.execute(parameters: params);

  if (parseResponse.success) {
    return showSuccess("ItemCartList was successfully added!", context);
  } else {
    showError("ItemCartList already exists or invalid!", context);
  }
}
