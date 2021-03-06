import 'package:app_mercadinho/src/controller/cart/get_cart_list_controller.dart';
import 'package:app_mercadinho/src/controller/order/order_checkout_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_mercadinho/src/pages/orders/components/get_order_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/config/custom_colors.dart';
import 'package:app_mercadinho/src/pages/cart/components/cart_tile.dart';
import 'package:app_mercadinho/src/services/utils_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  final GetCartListController controller = GetCartListController();
  final OrderCheckoutController controllerOrder = OrderCheckoutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          // Lista de itens do carrinho
          Expanded(
            child: Observer(builder: (_) {
              return ListView.builder(
                //itemCount: appData.cartItems.length,
                //itemCount: cartItems.length,
                itemCount: controller.cartItemList.length,

                itemBuilder: (_, index) {
                  return CartTile(
                    //cartItem: appData.cartItems[index],

                    //cartItem: cartItems[index],

                    cartItem: controller.cartItemList[index],
                    remove: controller.removeItemFromCart,
                    cartTotalPrice: controller.cartTotalPrice,
                  );
                },
              );
            }),
          ),

          // Total e botão de concluir o pedido
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total geral',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Observer(builder: (_) {
                        return Text(
                          utilsServices
                              .priceToCurrency(controller.cartTotalPrice()),
                          style: TextStyle(
                            fontSize: 23,
                            color: CustomColors.customSwatchColor,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      if (controller.cartTotalPrice() > 0) {
                        //RETORNO DO ID DO PEDIDO
                        String? result = await showOrderConfirmation();

                        if (result != "") {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return GetOrderId(orderId: result!);
                            },
                          );
                        } else {
                          utilsServices.showToast(
                            message: 'Pedido não confirmado',
                            isError: true,
                          );
                        }
                      } else {
                        utilsServices.showToast(
                          message: 'Insira ao menos um item no carrinho!',
                          isError: true,
                        );
                      }
                    },
                    child: const Text(
                      'Concluir pedido',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> showOrderConfirmation() {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente concluir o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop("");
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                //GERA UM NOVO PEDIDO
                String numberOrder = "";
                numberOrder = await controllerOrder.orderCheckout(controller.cartTotalPrice());
                Navigator.of(context).pop(numberOrder);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
