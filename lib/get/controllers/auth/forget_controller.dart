import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final code = 0.obs;
  final phoneNumber = ''.obs;
  final isResent = false.obs;
  final isResettingPassword = false.obs;
  final isSendingCode = false.obs;
}
