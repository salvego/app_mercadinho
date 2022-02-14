import 'package:app_mercadinho/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });

  CartItemModel.fromJson(Map<String, dynamic> json)
      : item = json['product'].cast<ItemModel>(),
        quantity = json['quantity'];

  double totalPrice() => item.price * quantity;
}
