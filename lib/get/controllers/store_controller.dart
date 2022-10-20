import 'package:get/get.dart';

class StoreController extends GetxController {
  // final totalRating = 1.0.obs;

  final selectedAddressIndex = 0.obs;
  final selectedPaymentCardIndex = 0.obs;
  final paymentSystem = 'cash'.obs;
  final isCardSystem = false.obs;
  final isDefaultAddress = false.obs;
  final isAddressLongPressed = false.obs;

  final gender = 'm'.obs;

  void updatePaymentSystem(String paymentSystem) {
    this.paymentSystem(paymentSystem);
    isCardSystem(paymentSystem == 'card');
    // print(isCardSystem.value);
  }

  // void updateTotalRating(rating) {
  //   totalRating(rating);
  // }
}
