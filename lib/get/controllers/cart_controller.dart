import 'package:e_grocery/database/controller/cart_db_controller.dart';
import 'package:e_grocery/models/cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late RxList<CartProduct> cartOrders = <CartProduct>[].obs;
  final orderQuantity = <int>[].obs;
  final totalWeight = 0.0.obs;
  final totalPrice = 0.0.obs;
  static final _cartDbController = CartDbController();

  @override
  void onInit() async {
    cartOrders.value = await _cartDbController.read();
    for (var order in cartOrders) {
      orderQuantity.add(order.quantity);
    }
    calculateTotalWeight();
    calculateTotalPrice();
    super.onInit();
  }

  void adobtQuantities() {
    for (var i = 0; i < cartOrders.length; i++) {
      cartOrders[i].quantity = orderQuantity[i];
      _cartDbController.update(cartOrders[i]);
    }
  }

  void calculateTotalWeight() {
    double tempSum = 0;
    for (var count in orderQuantity) {
      tempSum += count;
    }
    totalWeight.value = tempSum;
  }

  void calculateTotalPrice() {
    double tempSum = 0;
    // for (var order in cartOrders) {
    //   // tempSum += order.totalPrice;
    //   tempSum += order.price * order.quantity;
    // }
    for (int i = 0; i < cartOrders.length; i++) {
      tempSum += cartOrders[i].price * orderQuantity[i];
    }
    totalPrice.value = tempSum;
  }

  // Future<CartController> init() async {
  //   cartOrders = (await _cartDbController.read()).obs;
  //   calculateTotalWeight();
  //   calculateTotalPrice();
  //   return this;
  // }

  // // final cartItems = await _cartDbController.read().obs;

  // Future<List<Cart>> get cartList async {
  //   return await _cartDbController.read();
  // }

  // void incrementOrderQuantity(int index) {
  //   orderQuantity[index]++;
  // }

  // void decrementOrderQuantity(int index) {
  //   if (orderQuantity[index] == 1) return;
  //   orderQuantity[index]--;
  // }

  // void calculateTotalPrice() {
  //   double tempSum = 0;
  //   for (int i = 0; i < cartOrders.length; i++) {
  //     tempSum += double.parse(cartOrders[i].price) * orderQuantity[i];
  //   }
  //   totalPrice.value = tempSum;
  // }

  // void calculateTotalWeight() {
  //   double tempCount = 0;
  //   for (var order in cartOrders) {
  //     tempCount += order.quantity;
  //   }
  //   totalWeight.value = tempCount;
  // }

}
