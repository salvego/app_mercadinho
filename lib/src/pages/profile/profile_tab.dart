import 'package:app_mercadinho/src/controller/auth/change_password_controller.dart';
import 'package:app_mercadinho/src/controller/auth/logout_controller.dart';
import 'package:app_mercadinho/src/widgets/custom_icon_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_mercadinho/src/config/globals.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/pages/common_widgets/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  final LogoutController logoutController = LogoutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {
              logoutController.userLogout(context);
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
         // Email
         TextFormField(
           readOnly: true,
           initialValue: goUser.email,
           decoration: const InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'E-mail',
          ),
         ),

         // Nome
         TextFormField(
           readOnly: true,
           initialValue: goUser.usuario,
           decoration: const InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Nome',
          ),
         ),
//
         // Celular
         TextFormField(
           readOnly: true,
           initialValue: goUser.phone,
           decoration: const InputDecoration(
            icon: Icon(Icons.phone),
            labelText: 'Celular',
          ),
         ),
//
         // CPF
         TextFormField(
           readOnly: true,
           initialValue: goUser.cpf,
           decoration: const InputDecoration(
            icon: Icon(Icons.file_copy),
            labelText: 'CPF',
          ),
         ),

          // Botão para atualizar a senha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text('Atualizar senha'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {

    final ChangePasswordController controller = ChangePasswordController();


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
                        'Atualização de senha',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // E-mail
                    Observer(builder: (_) {
                      return CustomTextField(
                        hint: 'E-mail',
                        prefix: const Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: controller.setEmail,
                        enabled: !controller.loading,
                      );
                    }),
//
                   Observer(builder: (_) {
                      return CustomTextField(
                        hint: 'Senha Atual',
                        prefix: const Icon(Icons.lock),
                        obscure: !controller.passwordVisible,
                        onChanged: controller.setCurrentPassword,
                        enabled: !controller.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: controller.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: controller.togglePasswordVisible,
                        ),
                      );
                    }),

                   // Nova senha
                   Observer(builder: (_) {
                      return CustomTextField(
                        hint: 'Nova Senha',
                        prefix: const Icon(Icons.lock),
                        obscure: !controller.passwordVisible,
                        onChanged: controller.setNewPassword,
                        enabled: !controller.loading,
                        suffix: CustomIconButton(
                          radius: 32,
                          iconData: controller.passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onTap: controller.togglePasswordVisible,
                        ),
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
                          controller.changePasssword(context);
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
}
