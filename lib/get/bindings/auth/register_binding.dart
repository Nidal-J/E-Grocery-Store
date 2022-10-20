import 'package:e_grocery/get/controllers/auth/register_controller.dart';
import 'package:e_grocery/get/controllers/cities_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => CitiesController());
  }
}
