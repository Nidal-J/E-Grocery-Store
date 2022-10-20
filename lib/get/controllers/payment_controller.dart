import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  final cardType = 'Visa'.obs;
  final expDate = DateTime.now().obs;
}
