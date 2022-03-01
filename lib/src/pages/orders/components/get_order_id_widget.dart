
import 'package:app_mercadinho/src/api/order/api_get_order_id_list.dart';
import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:app_mercadinho/src/pages/common_widgets/payment_dialog.dart';
import 'package:flutter/material.dart';

class GetOrderId extends StatefulWidget {

  final String orderId;

  GetOrderId({
    Key? key,
    required this.orderId,
  }) : super(key: key);


  @override
  _GetOrderIdState createState() => _GetOrderIdState();
}

class _GetOrderIdState extends State<GetOrderId> {

  List<OrderModel> orders = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getOrderIdList(widget.orderId).then((value) {
      setState(() {
        orders = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return PaymentDialog(
                        order: orders[0],
                      );
  }



}