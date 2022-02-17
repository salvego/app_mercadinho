import 'package:app_mercadinho/src/api/cart/api_get_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/config/custom_colors.dart';
import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:app_mercadinho/src/pages/cart/components/cart_tile.dart';
import 'package:app_mercadinho/src/pages/common_widgets/payment_dialog.dart';
import 'package:app_mercadinho/src/services/utils_services.dart';
import 'package:app_mercadinho/src/config/app_data.dart' as appData;

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCartItemsList().then((value) {
      setState(() {
        cartItems = value;
      });
    });
  }

  void removeItemFromCart(CartItemModel cartItem) {
    setState(() {
      cartItems.remove(cartItem);

      utilsServices.showToast(
          message: '${cartItem.item.title} removido(a) do carrinho');
    });
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in cartItems) {
      setState(() {
        total += item.totalPrice();
      });
    }

    return total;
  }

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
            child: ListView.builder(
              //itemCount: appData.cartItems.length,
              itemCount: cartItems.length,

              itemBuilder: (_, index) {
                return CartTile(
                  //cartItem: appData.cartItems[index],

                  cartItem: cartItems[index],
                  remove: removeItemFromCart,
                  cartTotalPrice: cartTotalPrice,
                );
              },
            ),
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
                      Text(
                        utilsServices.priceToCurrency(cartTotalPrice()),
                        style: TextStyle(
                          fontSize: 23,
                          color: CustomColors.customSwatchColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      bool? result = await showOrderConfirmation();

                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: appData.orders.first,
                            );
                          },
                        );
                      } else {
                        utilsServices.showToast(
                          message: 'Pedido não confirmado',
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

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
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
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
