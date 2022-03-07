import 'package:app_mercadinho/src/helpers/message.dart';
import 'package:app_mercadinho/src/pages/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<bool?> resetPassword(BuildContext context) {

  final TextEditingController emailController = TextEditingController();


  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Titulo
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Reset de senha',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // E-mail
//                  CustomTextField(
//                    onChanged: emailController,
//                    prefix: const Icon(Icons.lock),
//                    hint: 'E-mail',
//                  ),

                  // Botão de confirmação
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {

                        sendResetPasssword(
                            emailController.text,
                            context);
                      },
                      child: const Text('Atualizar'),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void sendResetPasssword(String email, BuildContext context) async {

  final ParseCloudFunction function = ParseCloudFunction('reset-password', autoSendSessionId: true);
  final Map<String, dynamic> params = <String, dynamic>{
    'email': email
  };

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
