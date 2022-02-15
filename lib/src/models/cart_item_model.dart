import 'package:app_mercadinho/src/models/item_model.dart';

class CartItemModel {
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.item,
    required this.quantity,
  });

  CartItemModel.fromJson(Map<String, dynamic> json)
      : item = ItemModel.fromJson(json['product']),
        quantity = json['quantity'];

  double totalPrice() => item.price * quantity;
}
