import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final cityTapped = false.obs;
  final cityId =
      SharedPrefController().getByKey<String>(key: PrefKeys.cityId.name).obs;

  final TextEditingController nameController = TextEditingController(
      text: SharedPrefController().getByKey(key: PrefKeys.name.name));

  final gender =
      (SharedPrefController().getByKey<String>(key: PrefKeys.gender.name)).obs;
  final date = DateTime(2000, 01, 01).obs;

  final isEditedProfile = false.obs;
  void updateEditedProfile() {
    isEditedProfile.value = !isEditedProfile.value;
  }

  // final TextEditingController Controller = TextEditingController(text: SharedPrefController().getByKey(key: PrefKeys.name.name));
  // final TextEditingController nameController = TextEditingController(text: SharedPrefController().getByKey(key: PrefKeys.name.name));
}
