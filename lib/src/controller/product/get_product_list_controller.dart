import 'package:app_mercadinho/src/models/item_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'get_product_list_controller.g.dart';

class GetProductListController = GetProductListControllerBase
    with _$GetProductListController;

abstract class GetProductListControllerBase with Store {
  GetProductListControllerBase() {
    autorun((_) async {
    
      final newProducts = await getProductList(page: page, itemsPerPage: itemsPerPage, categoryId: categoryId);
      setProductList(newProducts);

    });
  }

  ObservableList productList = ObservableList();

  @observable
  String categoryId = 'HH7vSREpsb';

  @action
  void setCategoryId(String value) {
    categoryId = value;
  }

  @observable
  int page = 0;

  @observable
  int itemsPerPage = 10;

  
  @action
  void setProductList(List itemList) {
    productList.clear();
    productList.addAll(itemList);
  }

  
  // Future<void> _loadItemList() async {
  //   final productList = await getProductList();
  //   setProductList(productList);
  // }

  Future<List> getProductList(
      {int? page, int? itemsPerPage, String? categoryId}) async {
    final ParseCloudFunction function = ParseCloudFunction('get-product-list');

    final Map<String, dynamic> params = <String, dynamic>{
      'page': page,
      'itemsPerPage': itemsPerPage,
      'categoryId': categoryId
    };

    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    if (parseResponse.success) {
      if (parseResponse.result != null) {
        return parseResponse.result.map((e) => ItemModel.fromJson(e)).toList();
      }
    }

    return [];
  }
}
