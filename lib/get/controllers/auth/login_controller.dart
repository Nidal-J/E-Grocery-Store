import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;
  final isLogging = false.obs;
}

/*
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  @override
  void onInit() {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
*/ 