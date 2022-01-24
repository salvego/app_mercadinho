import 'package:app_mercadinho/src/api/auth/api_login.dart';
import 'package:app_mercadinho/src/config/globals.dart';
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void newUser(String email, String password, String fullname, String phone, String cpf, BuildContext context) async {

  final ParseCloudFunction function = ParseCloudFunction('signup');
  final Map<String, dynamic> params = <String, dynamic>{
    'email': email,
    'password': password,
    'fullname': fullname,
    'phone': phone,
    'cpf': cpf,
  };

  final ParseResponse parseResponse =
  await function.execute(parameters: params);

  if (parseResponse.success) {

    Navigator.of(context).pop();
    return showSuccess("User was successfully create!", context);

  } else {

    showError("Email already exists or invalid!", context);

  }
}