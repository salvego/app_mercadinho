// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_items_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetOrderItemsListController on GetOrderItemsListControllerBase, Store {
  final _$orderIdAtom = Atom(name: 'GetOrderItemsListControllerBase.orderId');

  @override
  String? get orderId {
    _$orderIdAtom.reportRead();
    return super.orderId;
  }

  @override
  set orderId(String? value) {
    _$orderIdAtom.reportWrite(value, super.orderId, () {
      super.orderId = value;
    });
  }

  final _$GetOrderItemsListControllerBaseActionController =
      ActionController(name: 'GetOrderItemsListControllerBase');

  @override
  void setOrderId(String value) {
    final _$actionInfo = _$GetOrderItemsListControllerBaseActionController
        .startAction(name: 'GetOrderItemsListControllerBase.setOrderId');
    try {
      return super.setOrderId(value);
    } finally {
      _$GetOrderItemsListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderItemsList(List<dynamic> orderItemList) {
    final _$actionInfo = _$GetOrderItemsListControllerBaseActionController
        .startAction(name: 'GetOrderItemsListControllerBase.setOrderItemsList');
    try {
      return super.setOrderItemsList(orderItemList);
    } finally {
      _$GetOrderItemsListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderId: ${orderId}
    ''';
  }
}
