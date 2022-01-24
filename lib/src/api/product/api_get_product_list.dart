

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void getProductList() async {
  final ParseCloudFunction function = ParseCloudFunction('get-product-list');
  final ParseResponse parseResponse = await function.execute();
  if (parseResponse.success) {
    if (parseResponse.result != null) {
      for (final todo in parseResponse.result) {
        //Use fromJson method to convert map in ParseObject
        print(ParseObject('Product').fromJson(todo));
      }
    }
  }
}