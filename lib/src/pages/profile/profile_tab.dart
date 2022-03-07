import '../../controller/auth/api_change_password.dart';
import '../../controller/auth/api_logout.dart';
import 'package:app_mercadinho/src/config/globals.dart';
import 'package:flutter/material.dart';
import 'package:app_mercadinho/src/pages/common_widgets/custom_text_field.dart';
import 'package:app_mercadinho/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {
              userLogout(context);
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
//          CustomTextField(
//            readOnly: true,
//            initialValue: goUser.email,
//            icon: Icons.email,
//            label: 'Email',
//          ),
//
//          // Nome
//          CustomTextField(
//            readOnly: true,
//            initialValue: goUser.usuario,
//            icon: Icons.person,
//            label: 'Nome',
//          ),
//
//          // Celular
//          CustomTextField(
//            readOnly: true,
//            initialValue: goUser.phone,
//            icon: Icons.phone,
//            label: 'Celular',
//          ),
//
//          // CPF
//          CustomTextField(
//            readOnly: true,
//            initialValue: goUser.cpf,
//            icon: Icons.file_copy,
//            label: 'CPF',
//            isSecret: true,
//          ),

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

    final TextEditingController emailController = TextEditingController();
    final TextEditingController currentPassController = TextEditingController();
    final TextEditingController newPassController = TextEditingController();


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
//                     CustomTextField(
//                      controller: emailController,
//                      icon: Icons.lock,
//                      label: 'E-mail',
//                    ),
//
//                    // Senha Atual
//                     CustomTextField(
//                      controller: currentPassController,
//                      isSecret: true,
//                      icon: Icons.lock_outline,
//                      label: 'Senha Atual',
//                    ),
//
//                    // Nova senha
//                     CustomTextField(
//                      controller: newPassController,
//                      isSecret: true,
//                      icon: Icons.lock_outline,
//                      label: 'Nova senha',
//                    ),

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

                          changePasssword(
                              emailController.text,
                              currentPassController.text,
                              newPassController.text,
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
}
