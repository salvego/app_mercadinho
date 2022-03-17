// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GetProductListController on GetProductListControllerBase, Store {
  final _$categoryIdAtom =
      Atom(name: 'GetProductListControllerBase.categoryId');

  @override
  String get categoryId {
    _$categoryIdAtom.reportRead();
    return super.categoryId;
  }

  @override
  set categoryId(String value) {
    _$categoryIdAtom.reportWrite(value, super.categoryId, () {
      super.categoryId = value;
    });
  }

  final _$pageAtom = Atom(name: 'GetProductListControllerBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$itemsPerPageAtom =
      Atom(name: 'GetProductListControllerBase.itemsPerPage');

  @override
  int get itemsPerPage {
    _$itemsPerPageAtom.reportRead();
    return super.itemsPerPage;
  }

  @override
  set itemsPerPage(int value) {
    _$itemsPerPageAtom.reportWrite(value, super.itemsPerPage, () {
      super.itemsPerPage = value;
    });
  }

  final _$GetProductListControllerBaseActionController =
      ActionController(name: 'GetProductListControllerBase');

  @override
  void setCategoryId(String value) {
    final _$actionInfo = _$GetProductListControllerBaseActionController
        .startAction(name: 'GetProductListControllerBase.setCategoryId');
    try {
      return super.setCategoryId(value);
    } finally {
      _$GetProductListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductList(List<dynamic> itemList) {
    final _$actionInfo = _$GetProductListControllerBaseActionController
        .startAction(name: 'GetProductListControllerBase.setProductList');
    try {
      return super.setProductList(itemList);
    } finally {
      _$GetProductListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryId: ${categoryId},
page: ${page},
itemsPerPage: ${itemsPerPage}
    ''';
  }
}
