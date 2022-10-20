import 'package:e_grocery/get/controllers/payment_controller.dart';
import 'package:get/get.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
