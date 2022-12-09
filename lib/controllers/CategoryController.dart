// ignore_for_file: file_names

import 'package:get/state_manager.dart';
import 'package:state_managment_with_getx/services/CategoryServices.dart';


class CategoryController extends GetxController {
  RxBool isLoading = false.obs;
  var categoryList = [].obs;

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  void getCategory() async {
    try {
      isLoading(true);
      var categories = await CategoryService.fetchCategory();
      if (categories != null) {
        categoryList.clear();
        categoryList.assignAll(categories);
      }else{
        categoryList.clear();
        categoryList(null);
      }
    } finally {
      isLoading(false);
    }
  }
}
