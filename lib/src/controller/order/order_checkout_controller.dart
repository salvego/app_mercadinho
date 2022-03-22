import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'order_checkout_controller.g.dart';

class OrderCheckoutController = OrderCheckoutControllerBase
    with _$OrderCheckoutController;

abstract class OrderCheckoutControllerBase with Store {
  Future<String> orderCheckout(double total) async {
    String idOrder = "";

    final ParseCloudFunction function = ParseCloudFunction('checkout');
    final Map<String, dynamic> params = <String, dynamic>{
      'total': total,
    };

    final ParseResponse parseResponse =
        await function.execute(parameters: params);

    if (parseResponse.success && parseResponse.result != null) {
      idOrder = parseResponse.result['id'];
    } else {
      idOrder = "";
    }

    return idOrder;
  }
}
