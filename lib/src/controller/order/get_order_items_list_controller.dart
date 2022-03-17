import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'get_order_items_list_controller.g.dart';

class GetOrderItemsListController = GetOrderItemsListControllerBase
    with _$GetOrderItemsListController;

abstract class GetOrderItemsListControllerBase with Store {
  GetOrderItemsListControllerBase() {
    autorun((_) async {
      final newOrderItems = await getOrderItemsList(orderId: orderId);
      setOrderItemsList(newOrderItems);
    });
  }

  ObservableList orderItemsList = ObservableList();

  @observable
  String? orderId;

  @action
  void setOrderId(String value) {
    orderId = value;
  }


  @action
  void setOrderItemsList(List orderItemList) {
    orderItemsList.clear();
    orderItemsList.addAll(orderItemList);
  }

  Future<List<CartItemModel>> getOrderItemsList({String? orderId}) async {
    final ParseCloudFunction function = ParseCloudFunction('get-order-items');
    final Map<String, dynamic> params = <String, dynamic>{
      'orderId': orderId,
    };

    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    if (parseResponse.success) {
      if (parseResponse.result != null) {
        return List<CartItemModel>.from(
            parseResponse.result.map((e) => CartItemModel.fromJson(e)));
      }
    }

    return [];
  }
}
