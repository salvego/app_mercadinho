import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void modifyQuantityItemCartList(
    String cartItemId, double quantity, BuildContext context) async {
  final ParseCloudFunction function = ParseCloudFunction('modify-item-quantity');
  final Map<String, dynamic> params = <String, dynamic>{
    'cartItemId': cartItemId,
    'quantity': quantity,
  };

  final ParseResponse parseResponse =
  await function.execute(parameters: params);

  if (parseResponse.success) {
    return showSuccess("Quantity was successfully alter!", context);
  } else {
    showError("Quantity already exists or invalid!", context);
  }
}