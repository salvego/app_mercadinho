import 'dart:convert';

import '../category/api_get_category_list.dart';
import 'package:app_mercadinho/src/api/product/api_get_product_list.dart';
import 'package:app_mercadinho/src/config/globals.dart';
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/models/category_model.dart';
import 'package:app_mercadinho/src/models/item_model.dart';
import 'package:app_mercadinho/src/pages/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:app_mercadinho/src/config/key_back4app.dart' as key_back4app;
import 'package:app_mercadinho/src/config/app_data.dart' as appData;

void userLogin(String email, String password, BuildContext context) async {
  final ParseCloudFunction function = ParseCloudFunction('login');
  final Map<String, dynamic> params = <String, dynamic>{
    'email': email,
    'password': password
  };

  final ParseResponse parseResponse =
      await function.execute(parameters: params);

  if (parseResponse.success) {
    goUser.myCurrentSessionToken = parseResponse.result['token'];
    goUser.id = parseResponse.result['id'];
    goUser.usuario = parseResponse.result['fullname'];
    goUser.email = parseResponse.result['email'];
    goUser.phone = parseResponse.result['phone'];
    goUser.cpf = parseResponse.result['cpf'];

    await Parse().initialize(
        key_back4app.keyApplicationId, key_back4app.keyParseServerUrl,
        clientKey: key_back4app.keyClientKey,
        sessionId: goUser.myCurrentSessionToken);

    goUser.isLoggedIn = true;

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
      return const BaseScreen();
    }));

//    List produts = [] ;
//    produts = await
//    getProductList().then((value) => value);
//
//    print(produts[0].title);



  } else {
    showError("User was fail login!", context);
  }
}
