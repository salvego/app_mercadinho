// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_id_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetOrderIdListController on GetOrderIdListControllerBase, Store {
  final _$idAtom = Atom(name: 'GetOrderIdListControllerBase.id');

  @override
  String? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$GetOrderIdListControllerBaseActionController =
      ActionController(name: 'GetOrderIdListControllerBase');

  @override
  void setId(String value) {
    final _$actionInfo = _$GetOrderIdListControllerBaseActionController
        .startAction(name: 'GetOrderIdListControllerBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$GetOrderIdListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOrderIdList(List<dynamic> idList) {
    final _$actionInfo = _$GetOrderIdListControllerBaseActionController
        .startAction(name: 'GetOrderIdListControllerBase.setOrderIdList');
    try {
      return super.setOrderIdList(idList);
    } finally {
      _$GetOrderIdListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id}
    ''';
  }
}
