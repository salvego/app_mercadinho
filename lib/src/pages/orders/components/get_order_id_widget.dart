import 'package:app_mercadinho/src/controller/order/get_order_id_list_controller.dart';
import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:app_mercadinho/src/pages/common_widgets/payment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  GetOrderIdListController controller = GetOrderIdListController();

  OrderModel? order;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.getOrderIdList(id: widget.orderId).then((value) {
      setState(() {
        order = value[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return order != null
          ? PaymentDialog(order: order!)
          : Container();
  }
}
