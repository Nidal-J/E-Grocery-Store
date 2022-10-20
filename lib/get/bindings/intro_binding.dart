import 'package:e_grocery/get/controllers/cities_controller.dart';
import 'package:get/get.dart';

class IntroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CitiesController());
  }
}
