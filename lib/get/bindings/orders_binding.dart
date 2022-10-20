import 'package:e_grocery/get/controllers/orders_controller.dart';
import 'package:get/get.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrdersController());
  }
}
