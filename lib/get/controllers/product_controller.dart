import 'package:get/get.dart';

class ProductController extends GetxController {
  final productIndex = 0.obs;
  final productQuantity = 1.obs;
  final userRating = 5.0.obs;
  final isFavorite = false.obs;
  // final product = Product().obs;

  // final cartItems = CartDbController().read();

  void updateProductIndex(int productIndex) {
    this.productIndex(productIndex);
  }

  void updateUserRating(rating) {
    userRating(rating);
  }
}
