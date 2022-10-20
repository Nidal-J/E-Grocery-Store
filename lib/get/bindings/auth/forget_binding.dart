import 'package:e_grocery/get/controllers/auth/forget_controller.dart';
import 'package:get/get.dart';

class ForgetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetController());
  }
}
