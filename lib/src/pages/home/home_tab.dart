import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:app_mercadinho/src/controller/cart/get_cart_list_controller.dart';
import 'package:app_mercadinho/src/controller/category/get_category_list_controller.dart';
import 'package:app_mercadinho/src/controller/product/get_product_list_controller.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/config/custom_colors.dart';
import 'package:app_mercadinho/src/pages/home/components/category_tile.dart';
import 'package:app_mercadinho/src/pages/home/components/item_tile.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_mercadinho/src/services/utils_services.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GetCategoryListController controllerCategory = GetCategoryListController();
  GetProductListController controllerProduct = GetProductListController();
  GetCartListController controllerCart = GetCartListController();
  final UtilsServices utilsServices = UtilsServices();

  String selectedCategory = 'Frutas';

  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                position: BadgePosition.topEnd(top: -15, end: 25),
                shape: BadgeShape.square,
                borderRadius: BorderRadius.circular(5),
                badgeColor: CustomColors.customContrastColor,
                badgeContent: Observer(builder: (_){
                  return Text(
                    controllerCart.countItemCart() > 0 ? utilsServices.priceToCurrency(controllerCart.cartTotalPrice()) +' | '+ controllerCart.countItemCart().toStringAsFixed(0) : 0.toStringAsFixed(0),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  );
                }),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToCardAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            // Campo de pesquisa
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: 'Pesquise aqui...',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),

            // Categorias
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 40,
              child: Observer(builder: (_) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTile(
                      onPressed: () {
                        setState(() {
                          selectedCategory =
                              controllerCategory.categoryList[index].title;
                        });

                        controllerProduct.categoryId =
                            controllerCategory.categoryList[index].id;

                      },
                      category: controllerCategory.categoryList[index].title,
                      isSelected:
                          controllerCategory.categoryList[index].title ==
                              selectedCategory,
                    );
                  },
                  separatorBuilder: (_, index) => const SizedBox(width: 10),
                  itemCount: controllerCategory.categoryList.length,
                );
              }),
            ),

            // Grid
            Expanded(
              child: Observer(builder: (_) {
                return GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5,
                  ),
                  //itemCount: appData.items.length,
                  itemCount: controllerProduct.productList.length,

                  itemBuilder: (_, index) {
                    
                    return ItemTile(
                        item: controllerProduct.productList[index],
                        cartAnimationMethod: itemSelectedCartAnimations);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
