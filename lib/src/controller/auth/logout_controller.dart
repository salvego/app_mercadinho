import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/pages/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'logout_controller.g.dart';

class LogoutController = LogoutControllerBase with _$LogoutController;

abstract class LogoutControllerBase with Store {
  

  @observable
  bool loggedIn = false;

  @action
  Future<void> userLogout(BuildContext context) async {

    final ParseCloudFunction function = ParseCloudFunction('logout');

    final ParseResponse parseResponse = await function.execute();

    if (parseResponse.success) {
      loggedIn = false;

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c) {
        return SignInScreen();
      }));
    } else {
      showError(parseResponse.error!.message, context);
    }
  }


}
