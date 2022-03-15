import 'package:app_mercadinho/src/models/category_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:mobx/mobx.dart';

part 'get_category_list_controller.g.dart';

class GetCategoryListController = GetCategoryListControllerBase
    with _$GetCategoryListController;

abstract class GetCategoryListControllerBase with Store {
  GetCategoryListControllerBase() {
    autorun((_) {
      _loadCategoryList();
    });
  }

  ObservableList categoryList = ObservableList();

  @action
  void setCategoryList(List catList) {
    categoryList.clear();
    categoryList.addAll(catList);
  }

  Future<void> _loadCategoryList() async {
    final categoryList = await getCategoryList();
    setCategoryList(categoryList);
  }

  Future<List> getCategoryList() async {
    final ParseCloudFunction function = ParseCloudFunction('get-category-list');
    final ParseResponse parseResponse = await function.execute();

    if (parseResponse.success) {
      if (parseResponse.result != null) {
        return parseResponse.result
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      }
    }

    return [];
  }
}
