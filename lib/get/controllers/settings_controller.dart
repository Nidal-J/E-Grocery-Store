import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final isAppNotificationsActive = false.obs;
  final isPhoneNotificationsActive = false.obs;
  final isOfferNotificationsActive = false.obs;
  final lang = userLocale.obs;
  final mode =
      SharedPrefController().getByKey<bool>(key: PrefKeys.isDark.name).obs;

  void changeLanguage(String lang) {
    this.lang(lang);
  }

  void changeMode(bool mode) {
    this.mode(mode);
  }
}
