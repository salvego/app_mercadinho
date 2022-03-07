import 'package:app_mercadinho/src/controller/auth/new_user_controller.dart';
import 'package:app_mercadinho/src/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/config/custom_colors.dart';
import 'package:app_mercadinho/src/pages/common_widgets/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final NewUserController controller = NewUserController();

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  // Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          prefix: const Icon(Icons.email),
                          hint: 'Email',
                          textInputType: TextInputType.emailAddress,
                          onChanged: controller.setEmail,
                          enabled: !controller.loading,
                        ),
                        CustomTextField(
                          hint: 'Senha',
                          prefix: const Icon(Icons.lock),
                          obscure: !controller.passwordVisible,
                          onChanged: controller.setPassword,
                          enabled: !controller.loading,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: controller.passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            onTap: controller.togglePasswordVisible,
                          ),
                        ),
                        CustomTextField(
                          onChanged: controller.setFullName,
                          prefix: const Icon(Icons.person),
                          hint: 'Nome',
                          enabled: !controller.loading,
                        ),
                        CustomTextField(
                          onChanged: controller.setPhone,
                          prefix: const Icon(Icons.phone),
                          hint: 'Celular',
                          inputFormatters: [phoneFormatter],
                          enabled: !controller.loading,
                        ),
                        CustomTextField(
                          onChanged: controller.setCPF,
                          prefix: const Icon(Icons.file_copy),
                          hint: 'CPF',
                          inputFormatters: [cpfFormatter],
                          enabled: !controller.loading,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {
                              //CADASTRA NOVO USUÁRIO
                              controller.newUser(context);
                            },
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
