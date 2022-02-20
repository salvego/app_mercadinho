import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<String> orderCheckout(double total) async {

  final ParseCloudFunction function = ParseCloudFunction('checkout');
  final Map<String, dynamic> params = <String, dynamic>{
    'total': total,
  };

  final ParseResponse parseResponse =
    await function.execute(parameters: params);


  if (parseResponse.success) {
    if (parseResponse.result != null) {

      print(parseResponse.result['id']);
      return parseResponse.result['id'];

    }
  }

  return "";

}