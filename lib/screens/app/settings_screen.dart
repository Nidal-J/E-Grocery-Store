import 'package:e_grocery/get/controllers/settings_controller.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:e_grocery/widgets/get_back_button.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.find<SettingsController>();
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: const GetBackButton(),
        title: Text('settings'.tr.toTitleCase()),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 26.h, 20.w, 26.h),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              leading: const Icon(Icons.language, color: AppColors.green),
              title: Text(
                'language'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                RadioListTile<String>(
                  activeColor: AppColors.green,
                  value: 'en',
                  groupValue: settingsController.lang.value,
                  onChanged: (value) {
                    settingsController.changeLanguage(value!);
                    SharedPrefController().saveLang(value);
                    var locale = Locale(value);
                    Get.updateLocale(locale);
                  },
                  title: const Text(
                    'ٌEnglish',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                RadioListTile<String>(
                  activeColor: AppColors.green,
                  value: 'ar',
                  groupValue: settingsController.lang.value,
                  onChanged: (value) {
                    settingsController.changeLanguage(value!);
                    SharedPrefController().saveLang(value);
                    var locale = Locale(value);
                    Get.updateLocale(locale);
                  },
                  title: const Text(
                    'اللغة العربية',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => ExpansionTile(
                leading: settingsController.isAppNotificationsActive.value
                    ? const Icon(
                        Icons.notifications_on_rounded,
                        color: AppColors.warning,
                      )
                    : const Icon(
                        Icons.notifications_off_rounded,
                        color: AppColors.grey,
                      ),
                title: Text(
                  'notifications'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: [
                  SwitchListTile(
                    activeColor: AppColors.green,
                    value: settingsController.isAppNotificationsActive.value,
                    onChanged: (checked) {
                      settingsController.isAppNotificationsActive.value =
                          checked;
                    },
                    title: Text(
                      'app_notifications'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SwitchListTile(
                    activeColor: AppColors.green,
                    value: settingsController.isPhoneNotificationsActive.value,
                    onChanged: (checked) {
                      settingsController.isPhoneNotificationsActive.value =
                          checked;
                    },
                    title: Text(
                      'phone_notifications'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SwitchListTile(
                    activeColor: AppColors.green,
                    value: settingsController.isOfferNotificationsActive.value,
                    onChanged: (checked) {
                      settingsController.isOfferNotificationsActive.value =
                          checked;
                    },
                    title: Text(
                      'offer_notifications'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => SwitchListTile(
                value: settingsController.mode.value ?? false,
                activeColor: AppColors.green,
                onChanged: (checked) {
                  settingsController.mode.value = checked;
                  SharedPrefController().saveMode(checked);
                },
                title: Text(
                  'dark_mode'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                secondary: Icon(
                  Icons.dark_mode,
                  color: settingsController.mode.value ?? false
                      ? AppColors.black
                      : AppColors.grey,
                ),
              ),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  titlePadding: EdgeInsets.only(top: 24.h),
                  contentPadding: EdgeInsets.only(top: 24.h),
                  radius: 10.r,
                  title: 'restore_dialog'.tr,
                  content: const Text(''),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('cancel'.tr),
                    ),
                    SizedBox(
                      width: 30.w,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        SharedPrefController().saveLang('en');
                        SharedPrefController().saveMode(false);
                        settingsController.changeLanguage('en');
                        settingsController.changeMode(false);
                        Get.updateLocale(const Locale('en'));
                      },
                      child: Text('ok'.tr),
                    ),
                  ],
                );
              },
              icon: const Icon(Icons.settings_backup_restore),
              label: Text('restore'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
/*
SharedPrefController().saveLang('en');
                SharedPrefController().saveMode(false);
                settingsController.changeLanguage('en');
                settingsController.changeMode(false);
                Get.updateLocale(const Locale('en'));*/
