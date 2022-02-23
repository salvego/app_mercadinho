import 'package:app_mercadinho/src/models/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  //List<CartItemModel> items;
  String statusOrder = 'pending_payment';
  String copyAndPaste = '';
  double total;

  OrderModel({
    required this.copyAndPaste,
    required this.createdDateTime,
    required this.id,
    //required this.items,
    required this.overdueDateTime,
    required this.statusOrder,
    required this.total,
  });

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdDateTime = DateTime.parse('2022-06-08 11:00:10.458'),
        overdueDateTime = DateTime.parse('2022-06-08 11:00:10.458'),
        //items =  List<CartItemModel>.from(json['items']),
        //statusOrder = json['statusOrder'].toString(),
        //copyAndPaste = json['copyAndPaste'].toString(),
        total = json['total'].toDouble();



}
