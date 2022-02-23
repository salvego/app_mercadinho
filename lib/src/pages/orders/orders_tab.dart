import 'package:app_mercadinho/src/api/order/api_get_order_list.dart';
import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/config/app_data.dart' as appData;
import 'package:app_mercadinho/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  List<OrderModel> orders = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getOrderList().then((value) {
      setState(() {
        orders = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        //itemBuilder: (_, index) => OrderTile(order: appData.orders[index]),
        itemBuilder: (_, index) => OrderTile(orderId: orders[index].id, order: orders[index],),
        //itemCount: appData.orders.length,
        itemCount: orders.length,
      ),
    );
  }
}
