import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';
import 'package:app_mercadinho/src/services/utils_services.dart';

part 'get_cart_list_controller.g.dart';

class GetCartListController = GetCartListControllerBase with _$GetCartListController;

abstract class GetCartListControllerBase with Store {

  final UtilsServices utilsServices = UtilsServices();

  GetCartListControllerBase(){

    autorun((_) {

      _loadCartItemList();
      cartTotalPrice();
      //removeItemFromCart;

    });

  }

  ObservableList<CartItemModel> cartItemList = ObservableList<CartItemModel>();


  @action
  void setCartItemList(List<CartItemModel> cartList){

      cartItemList.clear();
      cartItemList.addAll(cartList);
  }

  
  Future<void> _loadCartItemList() async{

    final cartItemList = await getCartItemsList();
    setCartItemList(cartItemList);

  } 
  
  Future<List<CartItemModel>> getCartItemsList() async {

    final ParseCloudFunction function = ParseCloudFunction('get-cart-items');
    final ParseResponse parseResponse = await function.execute();

    if (parseResponse.success) {
      if (parseResponse.result != null) {

        return List<CartItemModel>.from(parseResponse.result.map((e) => CartItemModel.fromJson(e)));

      }
    }

    return [];

  }

  void removeItemFromCart(CartItemModel cartItem){
      cartItemList.remove(cartItem);
  }


  double cartTotalPrice() {
    double total = 0;
 
    for (var item in cartItemList) {
        total += item.totalPrice();
    }

    return total;
  }

}
