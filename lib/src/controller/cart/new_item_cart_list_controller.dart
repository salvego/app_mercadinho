import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'new_item_cart_list_controller.g.dart';

class NewItemCartListController = NewItemCartListControllerBase
    with _$NewItemCartListController;

abstract class NewItemCartListControllerBase with Store {
  void newItemCartList(
      double quantity, String productId, BuildContext contextMessage) async {
    final ParseCloudFunction function = ParseCloudFunction('add-item-to-cart');
    final Map<String, dynamic> params = <String, dynamic>{
      'quantity': quantity,
      'productId': productId,
    };

    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    if (parseResponse.success) {
      return showSuccess("ItemCartList was successfully added!", contextMessage);
    } else {
      showError("ItemCartList already exists or invalid!", contextMessage);
    }
  }
}
