import 'package:e_grocery/get/controllers/store_controller.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StoreController>(StoreController(), permanent: true);
    // Get.lazyPut(() => StoreController(), fenix: true);
  }
}
