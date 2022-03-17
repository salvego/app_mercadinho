import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'get_order_list_controller.g.dart';

class GetOrderListController = GetOrderListControllerBase
    with _$GetOrderListController;

abstract class GetOrderListControllerBase with Store {
  GetOrderListControllerBase() {
    autorun((_) {
      _loadOrderList();
    });
  }

  ObservableList orderList = ObservableList();

  @action
  void setOrderList(List catList) {
    orderList.clear();
    orderList.addAll(catList);
  }

  Future<void> _loadOrderList() async {
    final categoryList = await getOrderList();
    setOrderList(categoryList);
  }

  Future<List<OrderModel>> getOrderList() async {
    final ParseCloudFunction function = ParseCloudFunction('get-orders');
    final ParseResponse parseResponse = await function.execute();

    if (parseResponse.success) {
      if (parseResponse.result != null) {
        return List<OrderModel>.from(
            parseResponse.result.map((e) => OrderModel.fromJson(e)));
      }
    }

    return [];
  }
}
