import 'package:app_mercadinho/src/controller/auth/reset_password_controller.dart';
import 'package:app_mercadinho/src/pages/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Future<bool?> resetPassword(BuildContext context) {
  final ResetPasswordController controller = ResetPasswordController();

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
                  //E-mail
                  Observer(builder: (_) {
                    return CustomTextField(
                      prefix: const Icon(Icons.lock),
                      hint: 'Email',
                      textInputType: TextInputType.emailAddress,
                      onChanged: controller.setEmail,
                      enabled: !controller.loading,
                    );
                  }),
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
                        controller.sendResetPasssword(context);
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
