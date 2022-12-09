// ignore_for_file: file_names

import "package:get/get.dart";
import 'package:state_managment_with_getx/controllers/CategoryController.dart';
import 'package:state_managment_with_getx/controllers/ProductController.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController());
    Get.put(CategoryController());
  }
}
