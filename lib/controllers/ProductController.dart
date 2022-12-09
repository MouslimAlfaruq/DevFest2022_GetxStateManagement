// ignore_for_file: file_names

import 'package:get/state_manager.dart';
import 'package:state_managment_with_getx/services/ProductServices.dart';


class ProductsController extends GetxController {
  RxBool isLoading = false.obs;
  var productsList = [].obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading(true);
      var products = await ProductsService.fetchProducts();
      if (products != null) {
        productsList.clear();
        productsList.assignAll(products);
      }else{
        productsList.clear();
        productsList(null);
      }
    } finally {
      isLoading(false);
    }
  }
}
