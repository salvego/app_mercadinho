import '../../../controller/cart/api_modify_item_quantity.dart';
import 'package:app_mercadinho/src/config/app_data.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/config/custom_colors.dart';
import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:app_mercadinho/src/pages/common_widgets/quantity_widget.dart';
import 'package:app_mercadinho/src/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  final Function() cartTotalPrice;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
    required this.cartTotalPrice,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        // Imagem
        leading: Image.network(
          widget.cartItem.item.picture,
          height: 60,
          width: 60,
        ),

        // Titulo
        title: Text(
          widget.cartItem.item.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        // Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            widget.cartItem.quantity = quantity;

            // ATUALIZA O TOTAL DO PEDIDO NA TELA
            widget.cartTotalPrice();

            if (quantity == 0) {
              // MODIFICA A QUANTIDADE DO ITEM NO CARRINHO NO BACK4APP (BANCO DE DADOS)
              modifyQuantityItemCartList(
                widget.cartItem.id,
                widget.cartItem.quantity,
                context,
              );
              // Remover item do carrinho
              //widget.remove(widget.cartItem);
            } else {
              // MODIFICA A QUANTIDADE DO ITEM NO CARRINHO NO BACK4APP (BANCO DE DADOS)
              modifyQuantityItemCartList(
                widget.cartItem.id,
                widget.cartItem.quantity,
                context,
              );
            }
            
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
