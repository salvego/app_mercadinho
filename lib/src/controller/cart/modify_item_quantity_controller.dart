import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'modify_item_quantity_controller.g.dart';

class ModifyItemQuantityController = ModifyItemQuantityControllerBase
    with _$ModifyItemQuantityController;

abstract class ModifyItemQuantityControllerBase with Store {
  void modifyQuantityItemCartList(
      String cartItemId, double quantity, BuildContext context) async {
    final ParseCloudFunction function =
        ParseCloudFunction('modify-item-quantity');
    final Map<String, dynamic> params = <String, dynamic>{
      'cartItemId': cartItemId,
      'quantity': quantity,
    };

    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    if (parseResponse.success) {
      if (quantity == 0) {
      } else {
      }
    } else {
      showError("Erro ao alterar quantidade!", context);
    }
  }
}
