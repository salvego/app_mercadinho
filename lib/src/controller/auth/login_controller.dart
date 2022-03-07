import 'package:app_mercadinho/src/config/globals.dart';
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:app_mercadinho/src/config/key_back4app.dart' as key_back4app;
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {


  @observable
  String email = '';

  @action
  void setEmail(String v) => email = v;

  @observable
  String password = '';

  @action
  void setPassword(String v) => password = v;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @computed
  bool get isEmailValid => EmailValidator.validate(email);

  @computed
  bool get isPasswordValid => password.length >= 3;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid && !loading;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  Future<void> userLogin(BuildContext context) async {

    loading = true;

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

      loading = false;
      loggedIn = true;

    } else {
      loading = false;
      showError("User was fail login!", context);
    }
  }


}


