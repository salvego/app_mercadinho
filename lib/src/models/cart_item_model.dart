import 'package:app_mercadinho/src/models/item_model.dart';

class CartItemModel {
  String id;
  ItemModel item;
  double quantity;

  CartItemModel({
    required this.id,
    required this.item,
    required this.quantity,
  });

  CartItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        item = ItemModel.fromJson(json['product']),
        quantity = json['quantity'].toDouble();

  double totalPrice() => item.price * quantity;
}
