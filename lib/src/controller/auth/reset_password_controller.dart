import 'package:app_mercadinho/src/config/globals.dart';
import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:app_mercadinho/src/config/key_back4app.dart' as key_back4app;
import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';

part 'reset_password_controller.g.dart';

class ResetPasswordController = ResetPasswordControllerBase
    with _$ResetPasswordController;

abstract class ResetPasswordControllerBase with Store {
  @observable
  String email = '';

  @action
  void setEmail(String v) => email = v;

  @computed
  bool get isEmailValid => EmailValidator.validate(email);

  @computed
  bool get isFormValid => isEmailValid && !loading;

  @observable
  bool loading = false;

  @action
  Future<void> sendResetPasssword(BuildContext context) async {
    final ParseCloudFunction function =
        ParseCloudFunction('reset-password', autoSendSessionId: true);
    final Map<String, dynamic> params = <String, dynamic>{'email': email};

    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    if (parseResponse.success) {
      Navigator.of(context).pop();
      showSuccess("User was successfully send e-mail!", context);
    } else {
      Navigator.of(context).pop();
      showError(parseResponse.error!.message, context);
    }
  }
}
