import 'package:app_mercadinho/src/pages/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:app_mercadinho/src/config/key_back4app.dart' as key_back4app;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Parse().initialize(key_back4app.keyApplicationId, key_back4app.keyParseServerUrl,
      clientKey: key_back4app.keyClientKey, autoSendSessionId: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
