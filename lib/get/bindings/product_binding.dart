import 'package:e_grocery/get/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
