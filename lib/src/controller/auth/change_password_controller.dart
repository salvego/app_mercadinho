import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/pages/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:app_mercadinho/src/config/key_back4app.dart' as key_back4app;
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

part 'change_password_controller.g.dart';

class ChangePasswordController = ChangePasswordControllerBase with _$ChangePasswordController;

abstract class ChangePasswordControllerBase with Store {
  @observable
  String email = '';

  @action
  void setEmail(String v) => email = v;

  @observable
  String currentPassword = '';

  @action
  void setCurrentPassword(String v) => currentPassword = v;

  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @observable
  String newPassword = '';

  @action
  void setNewPassword(String v) => newPassword = v;

  @computed
  bool get isEmailValid => EmailValidator.validate(email);

  @computed
  bool get isPasswordValid => currentPassword.length >= 3 && newPassword.length >= 3;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid && !loading;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  Future<void> changePasssword(BuildContext context) async {
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

      loggedIn = false;

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

}
