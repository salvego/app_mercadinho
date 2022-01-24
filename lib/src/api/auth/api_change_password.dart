import 'package:app_mercadinho/src/config/globals.dart';
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/pages/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:app_mercadinho/src/config/key_back4app.dart' as key_back4app;


void changePasssword(String email, String currentPassword , String newPassword, BuildContext context) async {
  //Executes a cloud function with parameters that returns a Map object

  final ParseCloudFunction function = ParseCloudFunction('change-password', autoSendSessionId: true);
  final Map<String, dynamic> params = <String, dynamic>{
    'email': email,
    'currentPassword': currentPassword,
    'newPassword': newPassword
  };

  final ParseResponse parseResponse =
  await function.execute(parameters: params);

  if (parseResponse.success) {

    goUser.isLoggedIn = false;

    await Parse().initialize(
      key_back4app.keyApplicationId,
      key_back4app.keyParseServerUrl,
      clientKey: key_back4app.keyClientKey,
      autoSendSessionId: true,
    );

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (c) {
          return SignInScreen();
        }));

    showSuccess("User was successfully changed password!", context);

  } else {
    showError(parseResponse.error!.message, context);
  }
}
