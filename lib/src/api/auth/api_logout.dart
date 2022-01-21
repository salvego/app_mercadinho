import 'package:app_mercadinho/src/pages/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

 Future<Object> userLogout(BuildContext context) async {

    final ParseCloudFunction function = ParseCloudFunction('logout');
    
    final ParseResponse parseResponse =
    await function.execute();
   

    if (parseResponse.success) {
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (c) {
            return SignInScreen();
          }));
    } else {
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (c) {
            return Container();
          }));
    }
  }

