import 'package:app_mercadinho/src/config/globals.dart';
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:app_mercadinho/src/config/key_back4app.dart' as key_back4app;
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

part 'new_user_controller.g.dart';

class NewUserController = NewUserControllerBase with _$NewUserController;

abstract class NewUserControllerBase with Store {
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

  @observable
  String fullname = '';

  @action
  void setFullName(String v) => fullname = v;

  @observable
  String phone = '';

  @action
  void setPhone(String v) => phone = v;

  @observable
  String cpf = '';

  @action
  void setCPF(String v) => cpf = v;

  @computed
  bool get isEmailValid => EmailValidator.validate(email);

  @computed
  bool get isPasswordValid => password.length >= 3;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid && !loading;

  @observable
  bool loading = false;

  Future<void> newUser(BuildContext context) async {

    loading = true;

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

      loading = false;
      Navigator.of(context).pop();
      return showSuccess("User was successfully create!", context);


    } else {

      loading = false;
      showError("Email already exists or invalid!", context);

    }
  }

}
