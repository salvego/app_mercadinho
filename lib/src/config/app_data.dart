import 'package:app_mercadinho/src/models/cart_item_model.dart';
import 'package:app_mercadinho/src/models/item_model.dart';
import 'package:app_mercadinho/src/models/order_model.dart';
import 'package:app_mercadinho/src/models/user_model.dart';

ItemModel apple = ItemModel(
  id: '1',
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  picture: 'assets/fruits/apple.png',
  title: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  id: '2',
  picture: 'assets/fruits/grape.png',
  title: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  id: '3',
  picture: 'assets/fruits/guava.png',
  title: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  id: '4',
  picture: 'assets/fruits/kiwi.png',
  title: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  id: '5',
  picture: 'assets/fruits/mango.png',
  title: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  id: '6',
  picture: 'assets/fruits/papaya.png',
  title: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Careais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    id: '1',
    item: apple,
    quantity: 4,
  ),
  CartItemModel(
    id: '2',
    item: mango,
    quantity: 2,
  ),
  CartItemModel(
    id: '3',
    item: guava,
    quantity: 1,
  ),
];

UserModel user = UserModel(
  phone: '99 9 9999-9999',
  cpf: '999.999.999-99',
  email: 'user@email.com',
  name: 'New User',
  password: '',
);

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    statusOrder: 'pending_payment',
    total: 11.0,
//    items: [
//      CartItemModel(
//        id: '1',
//        item: apple,
//        quantity: 2,
//      ),
//    ],
  ),

  // Pedido 02
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-06-08 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    statusOrder: 'delivered',
    total: 11.5,
//    items: [
//      CartItemModel(
//        id: '3',
//        item: guava,
//        quantity: 1,
//      ),
//    ],
  ),
];
