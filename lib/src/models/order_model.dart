import 'package:app_mercadinho/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.copyAndPaste,
    required this.createdDateTime,
    required this.id,
    required this.items,
    required this.overdueDateTime,
    required this.status,
    required this.total,
  });

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdDateTime = json['createdDateTime'],
        overdueDateTime = json['overdueDateTime'],
        items =  List<CartItemModel>.from(json['items']),
        status = json['status'],
        copyAndPaste = json['copyAndPaste'],
        total = json['total'].toDouble();



}
