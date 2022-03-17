import 'package:app_mercadinho/src/controller/order/get_order_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/pages/orders/components/order_tile.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OrdersTab extends StatefulWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  State<OrdersTab> createState() => _OrdersTabState();
}

class _OrdersTabState extends State<OrdersTab> {
  GetOrderListController controller = GetOrderListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: Observer(builder: (_) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(height: 10),
          itemBuilder: (_, index) => OrderTile(
            orderId: controller.orderList[index].id,
            order: controller.orderList[index],
          ),
          //itemCount: appData.orders.length,
          itemCount: controller.orderList.length,
        );
      }),
    );
  }
}
