import 'package:e_grocery/get/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() async {
    // await Get.putAsync<CartController>(() => CartController().init());
    Get.lazyPut(() => CartController());
  }
}
