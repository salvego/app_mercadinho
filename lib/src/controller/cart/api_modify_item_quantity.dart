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
    //return showSuccess("Quantity was successfully alter!", context);

    if (quantity == 0) {
        AlertDialog(
        title: const Text("Success!"),
        content: const Text("Quantidade removido(a) com sucesso!"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
    else
    {
      AlertDialog(
        title: const Text("Success!"),
        content: const Text("Quantidade alterado(a) com sucesso!"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    }
    
  } else {
    AlertDialog(
        title: const Text("Error!"),
        content: const Text("Quantidade não existe ou inválido!"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}