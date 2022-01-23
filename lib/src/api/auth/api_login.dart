import 'package:app_mercadinho/src/config/globals.dart';
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/pages/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void userLogin(String email, String password , BuildContext context) async {

    final ParseCloudFunction function = ParseCloudFunction('login');
    final Map<String, dynamic> params = <String, dynamic>{
      'email': email,
      'password': password
    };

    final ParseResponse parseResponse =
    await function.execute(parameters: params);



    if (parseResponse.success) {

      myCurrentSessionToken = parseResponse.result['token'];

      isLoggedIn = true;

       Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (c) {
            return const BaseScreen();
          }));

    } else {

      return showError("User was fail login!", context);

    }
 }
