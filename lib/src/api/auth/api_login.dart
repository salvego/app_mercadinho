
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/pages/base/base_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

 Future<Object> userLogin(String email, String password , BuildContext context) async {
    //Executes a cloud function with parameters that returns a Map object


    final ParseCloudFunction function = ParseCloudFunction('login');
    final Map<String, dynamic> params = <String, dynamic>{
      'email': email,
      'password': password
    };

    final ParseResponse parseResponse =
    await function.execute(parameters: params);

    if (parseResponse.success) {
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (c) {
            return BaseScreen();
          }));

      //showSuccess("User was successfully login!", context);
      /*setState(() {
        isLoggedIn = true;
      });*/
    } else {
      return Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (c) {
            return Container();
          }));
      //showError(parseResponse.error!.message, context);
    }
 }
