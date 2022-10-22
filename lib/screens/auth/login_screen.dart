import 'package:e_grocery/api/controllers/auth_api_controller.dart';
import 'package:e_grocery/constants/constants.dart';
import 'package:e_grocery/get/controllers/auth/login_controller.dart';
import 'package:e_grocery/models/api_response.dart';
import 'package:e_grocery/pref/shared_pref_controller.dart';
import 'package:e_grocery/routes/app_routes.dart';
import 'package:e_grocery/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  // final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.fromLTRB(24.w, 40.h, 24.w, 40.h),
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton.icon(
                      onPressed: () {
                        Get.updateLocale(userLocale == 'ar'
                            ? const Locale('en')
                            : const Locale('ar'));
                        SharedPrefController()
                            .saveLang(userLocale == 'ar' ? 'en' : 'ar');
                      },
                      icon: const Icon(Icons.language_rounded),
                      label: Text(userLocale == 'ar' ? 'En' : 'Ar'),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Transform(
                    transform: Matrix4.rotationY(userLocale == 'ar' ? pi : 0),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: AppColors.green.withOpacity(0.1),
                      radius: 60.r,
                      child: Image.asset(
                        AppImages.logo,
                        width: 63.w,
                        height: 54.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'login_greeting'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      height: 2.h,
                    ),
                  ),
                  Text(
                    'E-Grocery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'phone_number'.tr,
                        textAlign: TextAlign.start,
                        style: AppFonts.label,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextFormField(
                          controller: controller.phoneController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'required_error_message'.tr;
                            } else if (value.length != 9) {
                              return 'phone_length_error_message'.tr;
                            }
                            return null;
                          },
                          maxLength: 9,
                          textDirection: TextDirection.ltr,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            letterSpacing: 1.2.r,
                            fontSize: 18.sp,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 14.h),
                            prefix: Container(
                              height: 32.h,
                              width: 70.w,
                              alignment: Alignment.center,
                              padding: EdgeInsetsDirectional.only(end: 8.w),
                              margin: EdgeInsetsDirectional.only(end: 12.w),
                              decoration: const BoxDecoration(
                                border: BorderDirectional(
                                  end: BorderSide(
                                    width: 1,
                                    color: AppColors.green,
                                  ),
                                ),
                              ),
                              child: Text(
                                '+970',
                                style: TextStyle(
                                  letterSpacing: 1.2.r,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                            counterText: '',
                            // hintText: '59xxxxxxx',
                            fillColor: AppColors.lightGrey,
                            filled: true,
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(7.r),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Text(
                        'password'.tr,
                        textAlign: TextAlign.start,
                        style: AppFonts.label,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextFormField(
                            controller: controller.passwordController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'required_error_message'.tr;
                              } else if (value.length < 8) {
                                return 'password_length_error_message'.tr;
                              }
                              return null;
                            },
                            style: TextStyle(
                              letterSpacing: 1.2.r,
                              fontSize: 18.sp,
                            ),
                            obscureText: !controller.passwordVisible.value,
                            // textDirection: TextDirection.ltr,
                            textInputAction: TextInputAction.send,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 18.h),
                                fillColor: AppColors.lightGrey,
                                filled: true,
                                border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.r),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.green,
                                  ),
                                ),
                                suffixIcon: Obx(
                                  () => IconButton(
                                    onPressed: () {
                                      controller.passwordVisible(
                                          !controller.passwordVisible.value);
                                    },
                                    icon: controller.passwordVisible.value
                                        ? const Icon(
                                            Icons.visibility,
                                            color: AppColors.green,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                            color: AppColors.grey,
                                          ),
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.forgetPassword,
                            arguments: {
                              'phone': controller.phoneController.text
                            },
                          );
                        },
                        child: Text(
                          'forget_password'.tr,
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        controller.isLogging(true);
                        await _performLogin();
                      }
                    },
                    child: Text('login'.tr),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'have_no_account'.tr,
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.registerScreen);
                        },
                        child: Text(
                          'sign_up'.tr,
                          style: const TextStyle(
                            color: AppColors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.isLogging.value,
                child: const LoadingWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    ApiResponse loginResponse = await AuthApiController().login(
      phone: controller.phoneController.text,
      password: controller.passwordController.text,
    );
    controller.isLogging(false);
    if (loginResponse.success) {
      showSnackbar(
        title: '${'welcome'.tr} ..',
        message: loginResponse.message,
        success: true,
      );
      Get.offAllNamed(AppRoutes.homeScreen);
    } else {
      showSnackbar(
        message: loginResponse.message,
        success: false,
      );
    }
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      alignment: Alignment.center,
      color: Colors.black.withOpacity(0.5),
      child: const CircularProgressIndicator(
        color: AppColors.white,
      ),
    );
  }
}
