import 'package:app_mercadinho/src/api/order/api_get_order_items_list.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:app_mercadinho/src/pages/common_widgets/payment_dialog.dart';
import 'package:app_mercadinho/src/pages/orders/components/order_status_widget.dart';
import 'package:app_mercadinho/src/services/utils_services.dart';

class OrderTile extends StatefulWidget {
  final String orderId;
  final OrderModel order;

  OrderTile({
    Key? key,
    required this.orderId,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  List<CartItemModel> cartItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getOrderItemsList(widget.orderId).then((value) {
      setState(() {
        cartItems = value;
      });
    });
  }

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.order.statusOrder == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${widget.order.id}'),
              Text(
                utilsServices.formatDateTime(widget.order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  // Lista de produtos
                  // Expanded(
                  //   flex: 3,
                  //   child: SizedBox(
                  //     height: 150,
                  //     child: ListView(
                  //       children: order.items.map((orderItem) {
                  //         return _OrderItemWidget(
                  //           utilsServices: utilsServices,
                  //           orderItem: orderItem,
                  //         );
                  //       }).toList(),
                  //     ),
                  //   ),
                  // ),

                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (_, index) {
                          return _OrderItemWidget(
                            utilsServices: utilsServices,
                            orderItem: cartItems[index],
                          );
                        },
                      ),
                    ),
                  ),

                  // Divisão
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  // Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: widget.order.statusOrder,
                      isOverdue:
                          widget.order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),

            // Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(widget.order.total),
                  ),
                ],
              ),
            ),

            // Botão pagamento
            Visibility(
              visible: widget.order.statusOrder == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(
                        order: widget.order,
                      );
                    },
                  );
                },
                icon: Image.asset(
                  'assets/app_images/pix.png',
                  height: 18,
                ),
                label: const Text('Ver QR Code Pix'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Text(orderItem.item.title)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
