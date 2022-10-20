import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final passwordVisible = false.obs;

  final gender = 'M'.obs;
  final genderTapped = false.obs;
  final cityTapped = false.obs;
  final cityId = 1.obs;
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